Return-Path: <SRS0=MIYb=NC=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B87DC4338F
	for <soc@archiver.kernel.org>; Wed, 11 Aug 2021 18:40:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5C9B06105A; Wed, 11 Aug 2021 18:40:29 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CD4161008;
	Wed, 11 Aug 2021 18:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CD4161008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id b7so3840015plh.7;
        Wed, 11 Aug 2021 11:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6XWZ7uipzmbT4b9s5UP3Dp3Et7I/DEvFdMWNyQg4EWo=;
        b=GPgoi2ZI6/wumAp/8JAYCvpbFO6/29kaY+C78zJMlLZWYYFazLNLWJwwSENCgwePRl
         KDzXHPO0ZllueM4RRIMSxGniCkKDUOR/xXbDC2TM0C1JVLM1CBwqPyTJwprQ/7OtcFEe
         xfqalpAYn6yfK/fkyWA8MZzM3MAjZY5YH7jQeY7DNpue1mWA9Hgy6vT0Oj82dOSmMI0I
         vdYKmXX/1Ew0pZHMFTi7r1N+7BaGHgQTlKAguk8dhWGlGK+1WPCMW/q1U6Gw9b7BMlbo
         WMFTW8J06esth/QuB8SSyGoQiMshooYL+W8z83fmSVKsIIIb8AoRRnHLNgIQFn5Bm/Ez
         3geA==
X-Gm-Message-State: AOAM533eIuyKqEBnCxwqTYX/0chhBK9vOcLp5I0PB1Y56hgBGjTlPX4I
	4iPkBld0vKV+vqj5j5ULJQ==
X-Google-Smtp-Source: ABdhPJydzGSNHHLbCABFjtI2hErQQ3Hvcs3ObcdrBQP2nvWLFn8lM3bPlQ55R/pujUDc+0x05iMkZw==
X-Received: by 2002:a05:6a00:150d:b029:3c8:e86e:79ec with SMTP id q13-20020a056a00150db02903c8e86e79ecmr182380pfu.62.1628707228843;
        Wed, 11 Aug 2021 11:40:28 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
        by smtp.gmail.com with ESMTPSA id u21sm218257pfh.163.2021.08.11.11.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 11:40:27 -0700 (PDT)
Received: (nullmailer pid 66990 invoked by uid 1000);
	Wed, 11 Aug 2021 18:40:23 -0000
Date: Wed, 11 Aug 2021 12:40:23 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Olof Johansson <olof@lixom.net>, dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, soc@kernel.org, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add an entry for
 SKOV A/S
Message-ID: <YRQZl94LsG9smzI0@robh.at.kernel.org>
References: <20210804043439.11757-1-o.rempel@pengutronix.de>
 <20210804043439.11757-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804043439.11757-2-o.rempel@pengutronix.de>

On Wed, 04 Aug 2021 06:34:37 +0200, Oleksij Rempel wrote:
> Add "skov" entry for the SKOV A/S: https://www.skov.com/en/
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
