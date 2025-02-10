Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B7F14885B
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 05:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739165781; cv=none; b=E5zGBtHfEKKQjXbk+BoXpRtxF6bsw4zYOdccoew20jlelROK8uksywwbTW0y0q8PMrjHi4RashyjnmCmOkhxCOezrrUwPozziLS8m1acATnSBYE5HvKpgKp3WiFOxPgDq5bcgFs73VRXEBLE7D5W9f+Q2xokaKSJQ9TFrvgI7yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739165781; c=relaxed/simple;
	bh=urDld4RY+cYIO+TvMh385/JIv91I5yTnE2Iw1QXKAzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njI6LuGqAze8HWHj15Uog4OeXNm8yqtw3z74+YzbmFYLyW6OKU5nrZve1N7MqJI+mzRWgfhsUP7myY86p0jSPi+bnQlnou63LSo2brjP31LDZ3qp2ca3jw5JBev13PSMpbu5rhziKbuAp9wwK8D+aYph89iGmNdIKpgmYWWJh0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1XaXdvH; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1XaXdvH"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7be6fdeee35so703358885a.1
        for <soc@lists.linux.dev>; Sun, 09 Feb 2025 21:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739165779; x=1739770579; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ifdBl3NrYJonu6r4KpHBlucrHJcYm6tgOGSrXK8TmU=;
        b=V1XaXdvHNtlctkYWL2Ku9OCDXYHkL/KLCQJXfwCTpECJskKltjdePwI8pQYlphW/FT
         UCGbogb+NQiZFD0nKA5DqbSb4nQXGDMLkax18kzkR1XVz1SsEYlIrPTQ+jb7DB++vn7d
         qmdlRlA7zD5Y3F9keTVdGMvHCFLtKehVQ6F8AS4R85ErKaPeXwwhesC8ufzuGhraf7sP
         qlPDCllY1sNiMCYvxUVZuiBBRqtRqvhySg/0/Jq3rmSF5ndE7hg/5790yVahRfK1kTex
         dsrzfbT3lkwiijtN11P0hFW0kKQhCq8MVBp+qAMkXXHPlbXbBdbQhEBzyKWS74N/teiW
         r4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739165779; x=1739770579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ifdBl3NrYJonu6r4KpHBlucrHJcYm6tgOGSrXK8TmU=;
        b=BpHQuGGZLtNCrnHksWxAjRPqqVI/f2tbpbLPs6aPLKdrYx60DzwLZDCryogDN5u5zr
         m3Vwx+DSKLunkMoOVkGv7hecewfWJvcN/9Y9DspS1jSRNPWGXLwNCLv9IDetRjs9zLWH
         HHWtLA3kJLG79GM7aaLBUPLceQvXlG9D5yFkR8qzmR2Vtzb99hDXoUI2hHmBLgE4Ws5s
         +F9hMT4hFUs71hPL67zz5liKxK7QunlpCIo6UJAb46q53vjl1t/3flChN5XgwrXGgkaT
         ZWfsU0I+jPeVd/awazHcQdgi2yTiFioqUfKkpedL3K01MalDqDclFnbmwWuRD/ReYwJn
         QaeA==
X-Forwarded-Encrypted: i=1; AJvYcCVxppE1KIkYRBeeKFimo9xJY1lGzraZFO8Jr7AncB5PradD6CwXKivH/xeDYJ/Eg/0FoTc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuATcCMPERYC0fp4mT5AAaFYSVDj114TNpoIxkExxxygy8//28
	V36tu0YhHZ3lS5oKCM+VS1cPZhLHeDLyObWedDHhhefYm4mMUpFk
X-Gm-Gg: ASbGncsnHbN3GijjjqVvGU9rn3iJy+oB3F74X1saM5mnhz68DT3vKE8ipJGxCBP1UQc
	MVuljoyOWJYnXYImXe21phsYPTQH+q7eIBQX1R2NL9qHcm+rnJ0iQJ9A8o5OYvqCVxYAvqnAX3+
	vx7M//hh8+E317tmy1GLqxJjCMNdUNnjSfNt53nW9vGuU39+afcpylURZL2gUP18YOMuQmAnkX3
	5J+IJ3yDeTY1d9J2Tchs2LEKczM+VRsiaRF0CEAEcvS8M5SaYDHbq7oWjLA5bPWMQk=
X-Google-Smtp-Source: AGHT+IEWqO2pMAus1b90+jEl0xBixTJRuApL2Dml4vzHcusAiiCC0HuddoHfUyCUVXV1B1ACw5vOWg==
X-Received: by 2002:a05:620a:2893:b0:7af:c60b:5acf with SMTP id af79cd13be357-7c047ba6b65mr1800335285a.10.1739165778925;
        Sun, 09 Feb 2025 21:36:18 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041e9f4basm484915585a.67.2025.02.09.21.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 21:36:18 -0800 (PST)
Date: Mon, 10 Feb 2025 13:36:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Haylen Chu <heylenay@outlook.com>, 
	linux-arm-kernel@lists.infradead.org, Sebastian Reichel <sre@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 07/10] dt-bindings: reset: sophgo: Add CV18xx reset
 controller
Message-ID: <dlvmfdkxws6daxteiukdmce5rjr5vpcfey4tcpodq7d32rbj76@ikhlepkb26k7>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-8-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209220646.1090868-8-alexander.sverdlin@gmail.com>

On Sun, Feb 09, 2025 at 11:06:32PM +0100, Alexander Sverdlin wrote:
> Add DT bindings for CV18xx reset controller. The power/reboot driver is
> going to use only 4 bits from two different MMIO regions which can be
> potentially used by other subsystems/drivers, therefore the resources
> are not being claimed directly by the device/driver, but via syscons
> instead.
> 
> Link: https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  .../bindings/reset/sophgo,cv1800-reset.yaml   | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml
> new file mode 100644
> index 000000000000..4f058f99df5f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/sophgo,cv1800-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cvitek CV18xx/Sophgo SG2000 Reset Controller
> +
> +maintainers:
> +  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800-reset

Please use cv1800b, not cv1800. And this is a reboot device
not reset device. Refer other bindings to write yours.

Regards,
Inochi
