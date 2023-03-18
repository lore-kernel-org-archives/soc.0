Return-Path: <jic23@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1913C74A5B
	for <soc@archiver.kernel.org>; Sat, 18 Mar 2023 15:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B1C2C433D2; Sat, 18 Mar 2023 15:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB3EC433EF;
	Sat, 18 Mar 2023 15:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679154054;
	bh=PBSGuVhbQD6x3zrLgN8oNDlkbuAgVPgYiQwgc1Br7MM=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=ZZNeBEpEHnd1ErxTSJhxX6fIqBDK04GsUoLn4sfF7sWgGdCQUexcQwy3vhVleEusX
	 Gq31lKJcZb19d6YapdZPM5JnywRJ8YnozJtrfXl6GYPKWkHOtlage2eTjpeFfHUHjf
	 7R/sLc06fZk7D9x2M0WiiG2+n4u7O6KbL+U/LhgZzdr3Am36b4+n/rybms6tVEo7GW
	 BBXBr+xWYX/H0l7uCeVHd9xeaEIhvs59yFx5rTZLOAnBXdYzbJnAY1WId0gDh0LhXZ
	 /xdgvsTElxsaHFuAQ/IbSMmgqYMDKM+C+lZ6nzdWHfwO0zlm1Cjjown19Up5yoW/ju
	 4xnYtJtjMf3UQ==
Date: Sat, 18 Mar 2023 15:55:45 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Stefan Wahren <stefan.wahren@chargebyte.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Evgeniy
 Polyakov <zbr@ioremap.net>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-imx@nxp.com, Li Yang <leoyang.li@nxp.com>, Denis Ciocca
 <denis.ciocca@st.com>, soc@kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stefan.wahren@i2se.com
Subject: Re: [PATCH V2 4/8] dt-bindings: iio: st-sensors: Add IIS328DQ
 accelerometer
Message-ID: <20230318155534.16b47583@jic23-huawei>
In-Reply-To: <20230317103323.7741-5-stefan.wahren@chargebyte.com>
References: <20230317103323.7741-1-stefan.wahren@chargebyte.com>
	<20230317103323.7741-5-stefan.wahren@chargebyte.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Mar 2023 11:33:19 +0100
Stefan Wahren <stefan.wahren@chargebyte.com> wrote:

> The ST IIS328DQ is an accelerometer sensor, which is compatible with
> the already supported ST H3LIS331DL. So add the new compatible
> with a fallback to the ST sensor binding.
> 
> Link: https://lore.kernel.org/linux-iio/2bac9ecf-9d2e-967e-9020-1c950487d781@i2se.com/
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>	
> ---
>  Documentation/devicetree/bindings/iio/st,st-sensors.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/st,st-sensors.yaml b/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
> index c6201976378f..5eb71b24a7cb 100644
> --- a/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
> +++ b/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
> @@ -48,6 +48,9 @@ properties:
>            - st,lsm330d-accel
>            - st,lsm330dl-accel
>            - st,lsm330dlc-accel
> +      - items:
> +          - const: st,iis328dq
> +          - const: st,h3lis331dl-accel

Hmm. So this separates the particular 'oneOf' group from the description
associated with the ST accelerometers.

DT experts, is there a better way to do this?  Ideally we'd also associate
other similar groups going forwards so it might become less and less obvious
how the groupings work. (bit late for the many groups that exist
already in that list above this point).

If not I'm fine with it being fairly obvious what is going on in the binding file
current and we can rethink it later.

>        - description: Silan Accelerometers
>          enum:
>            - silan,sc7a20

