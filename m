Return-Path: <SRS0=0G2W=RB=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2844C433FE
	for <soc@archiver.kernel.org>; Thu, 16 Dec 2021 20:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0DF2C36AE8; Thu, 16 Dec 2021 20:31:47 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E170C36AE2;
	Thu, 16 Dec 2021 20:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E170C36AE2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso293781otj.11;
        Thu, 16 Dec 2021 12:31:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/WZk6rTknr9ohPbMfgyEB9lTmn2kskX3wnXdJpxoO54=;
        b=ym21kg8FATC8clp551dflfWTRch/3X3G3SDUvcCDXfAAAWFvCf/SJWYVMO1vrlQoTV
         kcfyBXebIFJmhatoW92EWy4Vy353cyFzCc394RDfiAudhtqeDK7M/4+LgF2LSt0ugnCG
         K0tGVUAwc/g/Jslj0AU30ORf7+WAyhhFyD+LbeyPEjpWqzQcG4Q196BQYAESyng+IfTi
         91Ja0yBwlu5xRds/o6J/Br29h7Cx3OIx8RhMWJeNdJhf5dJgMygxA0dvsnrU5k2jGoy5
         jqhwCPRLhq76BwTipjbhYaho8n5s67gkQpIUbKESLh/q7qMFSJj3KFA37EROR/1WYRfY
         5Dhw==
X-Gm-Message-State: AOAM53355qjgaVRX+JRtV3ZxwwK7yf7hIFRISE2E9lejlW5ztHBAD2Vj
	Tw90SUXi2+WVti/klF8QT1ZaeUO4hQ==
X-Google-Smtp-Source: ABdhPJxolUuSHrXvVWwD1DwilZGwq7k1Tjchu9lac4l0lol5CTbTY9vjTqv4KL+RF7m1rNgxNg36Gg==
X-Received: by 2002:a05:6830:1617:: with SMTP id g23mr13541257otr.117.1639686706300;
        Thu, 16 Dec 2021 12:31:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d12sm1196566otq.67.2021.12.16.12.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 12:31:45 -0800 (PST)
Received: (nullmailer pid 705688 invoked by uid 1000);
	Thu, 16 Dec 2021 20:31:44 -0000
Date: Thu, 16 Dec 2021 14:31:44 -0600
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: nobuhiro1.iwamatsu@toshiba.co.jp, abel.vesa@nxp.com, ulf.hansson@linaro.org, stefan@agner.ch, sboyd@kernel.org, soc@kernel.org, linux-serial@vger.kernel.org, adrian.hunter@intel.com, aisheng.dong@nxp.com, linux@armlinux.org.uk, shawnguo@kernel.org, giulio.benetti@benettiengineering.com, linux-kernel@vger.kernel.org, s.hauer@pengutronix.de, gregkh@linuxfoundation.org, kernel@pengutronix.de, robh+dt@kernel.org, mturquette@baylibre.com, linux-mmc@vger.kernel.org, Mr.Bossman075@gmail.com, olof@lixom.net, linus.walleij@linaro.org, jirislaby@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, arnd@arndb.de
Subject: Re: [PATCH v5 6/9] dt-bindings: serial: fsl-lpuart: add i.MXRT1050
 compatible
Message-ID: <YbuiMIfmBGIc/vao@robh.at.kernel.org>
References: <20211215220538.4180616-1-Mr.Bossman075@gmail.com>
 <20211215220538.4180616-7-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215220538.4180616-7-Mr.Bossman075@gmail.com>

On Wed, 15 Dec 2021 17:05:35 -0500, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add i.MXRT1050 documentation for compatible string.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Nothing done
> V2->V3:
> * Rename imxrt to imxrt1050
> V3->V4:
> * Nothing done
> V4->V5:
> * Change commit description to just 1050
> ---
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
