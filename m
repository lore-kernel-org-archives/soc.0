Return-Path: <SRS0=ywYp=QP=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C50FC433F5
	for <soc@archiver.kernel.org>; Sun, 28 Nov 2021 16:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF5AFC53FC7; Sun, 28 Nov 2021 16:31:39 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5CC2CC004E1;
	Sun, 28 Nov 2021 16:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5CC2CC004E1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id q25so29795245oiw.0;
        Sun, 28 Nov 2021 08:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PkR4wRUK5gkI0Qw8lNcjmLEGMLEhW9tgrTYzttS33uY=;
        b=DhmPQbVrQ2evjW+XN+HIZ0Fv9udWsndBuakED4iC0BPL/0FpzYPNaYMzFuIZSp+yIe
         3KZbSXqSbHgRRw3kn3jXCJPOyOt541wRi3olCNun3fK3xf3Fj98zoTspFoSPlDTvQ6xM
         Rv6NhlsvFCO7gHtLz03bNbt00plXaZmbL/Rk306kc7w3UAK9XXWvg7hVDZvT42TUdGpP
         lVoxQ24BQAPm0qHy5p0IAQsqGWNiP367RFIKvVrhWqmM4ZLMCKcksyjxILqLjPO2Q84q
         vXVallPChdtQ8AHLhpoChuVzsru2DMjbpnEMfA3z5xXzeFd5lh6OOGGEgmxU4ybtC8gc
         r5CQ==
X-Gm-Message-State: AOAM533pse+KCMYIhmUphAgvFRAmhYY113vKjXo7PTdKiairJchM1Niy
	cR6FAHG2rGAaJeib4HZHWQ==
X-Google-Smtp-Source: ABdhPJwH0qeDBaA8EBBP3qVVXiWISZ5v/PIXfPeSNWbUx58MHSW8/zktshdevP9pgdEmMr7y4DDarw==
X-Received: by 2002:a05:6808:150d:: with SMTP id u13mr35388484oiw.155.1638117098512;
        Sun, 28 Nov 2021 08:31:38 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d6:afc8:f6e9:d57a:3e26:ee41])
        by smtp.gmail.com with ESMTPSA id 184sm1220819oih.58.2021.11.28.08.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 08:31:37 -0800 (PST)
Received: (nullmailer pid 2677086 invoked by uid 1000);
	Sun, 28 Nov 2021 16:31:33 -0000
Date: Sun, 28 Nov 2021 10:31:33 -0600
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org, giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT
 compatible
Message-ID: <YaOu5XQZhejJCl1n@robh.at.kernel.org>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-9-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125211443.1150135-9-Mr.Bossman075@gmail.com>

On Thu, Nov 25, 2021 at 04:14:38PM -0500, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add i.MXRT documentation for compatible string.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Nothing done
> V2->V3:
> * Rename imxrt to imxrt1050
> ---
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
