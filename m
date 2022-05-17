Return-Path: <SRS0=yR+V=VZ=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E07C433EF
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 15:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6EA11C34113; Tue, 17 May 2022 15:12:30 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5E8EC385B8;
	Tue, 17 May 2022 15:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5E8EC385B8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id e189so22613615oia.8;
        Tue, 17 May 2022 08:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/dfPBNJl0BkkDm6rR5f4i06anC7912qzGjQ5goLE40g=;
        b=s2yo+StbsruCJx4htn/dkoOjwWb2F9XP5goVgpoghZPlkhlriHarFH+CCsvRYrgiBh
         mSK+4ILlpb5MJ82v5r7akqy+8QP7zpaXJcQU3cEgaizy/cIlkTfPLYe47xwwVYS2LGT6
         1pdgs94dwz7pESi2solwDBIE09GHWLLLZuKjYhqLWSHMh0lJ/vTkWpBAKyL47HkpjuCy
         xVH7G23cJzYXiVMUUNN8q7pTO1DaT1/6/c2wYspgnYS0JDX772K9/Dlv2qaarokmd03B
         dv4qGQRDEoougmJyVFyb978+U1z/NFZv0lRiLseAouBG8s4DQBGR5Sfg5NYEQg4GjJ6F
         RGmg==
X-Gm-Message-State: AOAM530QDwaNDpczuTygN+9KspJtjrmp/LamXNjyEXJk4AWZD1L7Bol9
	R3QP16jkv3PxtWFI6s5Y+w==
X-Google-Smtp-Source: ABdhPJzFfTUvwCWIB29bpybZvUCdBP4mQtaARfqBdm4hexGTPcJAiUL22/ZT2iuFmMl1WRl2Y3/ivQ==
X-Received: by 2002:a05:6808:ec2:b0:2f7:34db:691e with SMTP id q2-20020a0568080ec200b002f734db691emr16118754oiv.252.1652800348779;
        Tue, 17 May 2022 08:12:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t15-20020a056830224f00b0060603221235sm3331otd.5.2022.05.17.08.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 08:12:28 -0700 (PDT)
Received: (nullmailer pid 1045233 invoked by uid 1000);
	Tue, 17 May 2022 15:12:26 -0000
Date: Tue, 17 May 2022 10:12:26 -0500
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: sboyd@kernel.org, tglx@linutronix.de, aisheng.dong@nxp.com, linux@armlinux.org.uk, olof@lixom.net, kernel@pengutronix.de, festevam@gmail.com, leoyang.li@nxp.com, dev@lynxeye.de, linus.walleij@linaro.org, daniel.lezcano@linaro.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, tharvey@gateworks.com, cniedermaier@dh-electronics.com, linux-gpio@vger.kernel.org, stefan@agner.ch, arnd@arndb.de, linux-clk@vger.kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com, Mr.Bossman075@gmail.com, giulio.benetti@benettiengineering.com, soc@kernel.org, abel.vesa@nxp.com, linux-kernel@vger.kernel.org, clin@suse.com, marcel.ziswiler@toradex.com, mturquette@baylibre.com, devicetree@vger.kernel.org, sebastian.reichel@collabora.com, shawnguo@kernel.org
Subject: Re: [PATCH v3 04/15] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT1170
 compatible
Message-ID: <20220517151226.GA1045177-robh@kernel.org>
References: <20220517032802.451743-1-Mr.Bossman075@gmail.com>
 <20220517032802.451743-3-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517032802.451743-3-Mr.Bossman075@gmail.com>

On Mon, 16 May 2022 23:27:51 -0400, Jesse Taube wrote:
> Add i.MXRT1170 compatible string to Documentation.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1 -> V2:
>  - New commit to fix dtbs_check
> V2 -> V3:
>  - Fix typo
>  - Remove unused const
> ---
>  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
