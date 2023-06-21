import { corsHeaders } from "../_shared/cors.ts";
import { createApi } from "https://esm.sh/unsplash-js@7.0.18";
import { serve } from "https://deno.land/std@0.168.0/http/server.ts";

serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  const unsplash = createApi({
    accessKey: Deno.env.get("UNSPLASH_ACCESS_KEY") || "",
  });

  const result = await unsplash.photos.getRandom({
    contentFilter: "high",
    orientation: "landscape",
    topicIds: ["Mr49Evh5Sks", "bo8jQKTaE0Y", "6sMVjTLSkeQ", "xHxYTMHLgOc"],
  });

  if (result.errors) {
    const error = result.errors[0];
    console.log("Error occurred: ", error);
    return new Response(
      JSON.stringify({
        message: "There was an error while retrieving the Unsplash photo.",
        details: error,
      }),
      {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
        status: 500,
      }
    );
  }

  const {
    urls: { full },
    user: {
      name,
      links: { html: author_url },
    },
    links: { html: page_url },
  } = result.response;

  const data = {
    source: "unsplash",
    image_url: full,
    page_url,
    author_url,
    author: name,
  };

  return new Response(JSON.stringify(data), {
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
});
