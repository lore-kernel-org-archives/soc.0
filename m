Return-Path: <SRS0=ZujC=FN=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E27C433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 16:34:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D3D1522BF5; Wed,  9 Dec 2020 16:34:12 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A9BC22BF3
	for <soc@kernel.org>; Wed,  9 Dec 2020 16:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A9BC22BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-ot1-f68.google.com with SMTP id h18so1923348otq.12
        for <soc@kernel.org>; Wed, 09 Dec 2020 08:34:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9amksMRaTre1TKphGMa6RukD/0UXnG4x5MJc8xzPF+8=;
        b=rIAy/CN1gtMXB6wVx759rPa3eagottj9rHX9chxKf5+9LPna3bdp2SyzIPVNuB9KeS
         FBHnpAtj2lHjGA7yjLpQ9ig1A4kPxqNldNc5WW9Q8lxRhdaai5qIk2ypwVI+215vDgtx
         sXZEnM92GCG7NNhn9i8DlNMNKrJcCy7/PZ+3Vb+3HS6ar6EHqeWQS36VRi6NCR1aU4Px
         1fm3pwZwmgR80hv0tGKtcjgYUS4hlhW77qBb2f562Q79njk5MTJ6gzwO9Fu7/Jqn7+t1
         F+4ufJcRFPyN/jkacMK1X6JRzdti0lRmHjw6jspxZiRnuxGNQf56f58EKPPYta+ut0ib
         vgZw==
X-Gm-Message-State: AOAM531RsRfUgOT8vQOFirrRPIn0WQwxy8PMqAhTeWzH7YcRILB5lvnu
	0DYeGT5MbOTvO9guvM9q/yo9TnQaOA==
X-Google-Smtp-Source: ABdhPJw079OcH9Wx/tOkfeG7V+did7VdjHcLMAldhzxsI94Q/ADO9vhyb7XLabLtHUSZaUYxtlnBlg==
X-Received: by 2002:a05:6830:1011:: with SMTP id a17mr2440801otp.97.1607531651586;
        Wed, 09 Dec 2020 08:34:11 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h2sm480685otn.15.2020.12.09.08.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 08:34:10 -0800 (PST)
Received: (nullmailer pid 567548 invoked by uid 1000);
	Wed, 09 Dec 2020 16:34:09 -0000
Date: Wed, 9 Dec 2020 10:34:09 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, olof@lixom.net, arnd@arndb.de, w@1wt.eu
Subject: Re: [PATCH v2 02/10] dt-bindings: vendor-prefixes: Add honestar
 vendor prefix
Message-ID: <20201209163409.GA566058@robh.at.kernel.org>
References: <20201201134330.3037007-1-daniel@0x0f.com>
 <20201201134330.3037007-3-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201134330.3037007-3-daniel@0x0f.com>

On Tue, Dec 01, 2020 at 10:43:22PM +0900, Daniel Palmer wrote:
> Add prefix for Honestar Technologies Co., Ltd.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 2735be1a8470..a6cf2cef6f89 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -451,6 +451,8 @@ patternProperties:
>      description: Holt Integrated Circuits, Inc.
>    "^honeywell,.*":
>      description: Honeywell
> +  "^honestar,.*":
> +    description: Honestar Technologies Co., Ltd.

Alphabetical order please.

>    "^hoperun,.*":
>      description: Jiangsu HopeRun Software Co., Ltd.
>    "^hp,.*":
> -- 
> 2.29.2
> 
