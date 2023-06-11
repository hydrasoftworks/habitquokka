import { createApi } from "https://esm.sh/unsplash-js@7.0.18";
import { serve } from "https://deno.land/std@0.168.0/http/server.ts";

serve(async (_) => {
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
        details: result.errors[0],
      }),
      {
        headers: { "Content-Type": "application/json" },
        status: 500,
      }
    );
  }

  const {
    urls: { full },
    user: { name },
    links: { html },
  } = result.response;

  const data = {
    source: "unsplash",
    image_url: full,
    page_url: html,
    author: name,
  };

  return new Response(JSON.stringify(data), {
    headers: { "Content-Type": "application/json" },
  });
});
