Return-Path: <SRS0=yR+V=VZ=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD75FC433F5
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 20:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 924ADC34100; Tue, 17 May 2022 20:15:51 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D03ADC385B8;
	Tue, 17 May 2022 20:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D03ADC385B8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id q10so162713oia.9;
        Tue, 17 May 2022 13:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zLuq8/jIrJucgBFEatj0kqdfIbuB917FOxPZ2pJhVlM=;
        b=VuzCa9uNMvboj5q9emwMyVkm+tRs8caEFrGSvxEARP4/+d9Yg2itXEzyMUgHu7tPPw
         iiMHLO9/5qAvoIJ7qMSV+HzsddQuVili99uWVk+PxjojlSRbQb0h+YBgUOirmUPWbDer
         B3R1fLwZnDHPzARoitKoW8LpKh80t2g81ZVBG8AmSt3euvLcWGqStCIy89om0Hpky54C
         byb2URxzuHkhgY23s50yj+PAAy72onWfMpHSsGcPw+Hj9MIo4W4g864FEEvobAkaxyui
         /h9kPjpW1t6MbR0rxuWKpe7t1R4qpwVnmf10PGheLn6b2ej2hLBuTILBfUrFB5Uu1nfz
         5dnw==
X-Gm-Message-State: AOAM532FzhitH7SiUf8neaLREBD6/FSaNLJjrt8dOr97mSnYa2+dVh5k
	ETHw3xAqKj3/W7tQB8I2Hw==
X-Google-Smtp-Source: ABdhPJy4qhjcEoJ8bmJKtyo5sNfuFbkzX3w7OdbKNgT7Td6iqrnA+pCkTtn7SSqdKvy9VsyLUfshzg==
X-Received: by 2002:aca:7c1:0:b0:324:fe9a:9856 with SMTP id 184-20020aca07c1000000b00324fe9a9856mr16536836oih.293.1652818549940;
        Tue, 17 May 2022 13:15:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k12-20020a4a2a0c000000b0035eb4e5a6bbsm186513oof.17.2022.05.17.13.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 13:15:49 -0700 (PDT)
Received: (nullmailer pid 1554564 invoked by uid 1000);
	Tue, 17 May 2022 20:15:47 -0000
Date: Tue, 17 May 2022 15:15:47 -0500
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Mr.Bossman075@gmail.com, dev@lynxeye.de, giulio.benetti@benettiengineering.com, mturquette@baylibre.com, clin@suse.com, daniel.lezcano@linaro.org, tharvey@gateworks.com, tglx@linutronix.de, devicetree@vger.kernel.org, abel.vesa@nxp.com, cniedermaier@dh-electronics.com, arnd@arndb.de, linux-imx@nxp.com, linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org, shawnguo@kernel.org, linus.walleij@linaro.org, olof@lixom.net, robh+dt@kernel.org, leoyang.li@nxp.com, linux-kernel@vger.kernel.org, kernel@pengutronix.de, stefan@agner.ch, sebastian.reichel@collabora.com, festevam@gmail.com, linux-arm-kernel@lists.infradead.org, soc@kernel.org, sboyd@kernel.org, linux@armlinux.org.uk, s.hauer@pengutronix.de, marcel.ziswiler@toradex.com, aisheng.dong@nxp.com
Subject: Re: [PATCH v3 13/15] ARM: dts: imxrt1170-pinfunc: Add pinctrl
 binding header
Message-ID: <20220517201547.GA1554500-robh@kernel.org>
References: <20220517032802.451743-1-Mr.Bossman075@gmail.com>
 <20220517032802.451743-12-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517032802.451743-12-Mr.Bossman075@gmail.com>

On Mon, 16 May 2022 23:28:00 -0400, Jesse Taube wrote:
> Add binding header for i.MXRT1170 pinctrl device tree.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1 -> V2:
>  - Nothing done
> V2 -> V3:
>  - Change to (GPL-2.0-only OR BSD-2-Clause)
> ---
>  arch/arm/boot/dts/imxrt1170-pinfunc.h | 1561 +++++++++++++++++++++++++
>  1 file changed, 1561 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imxrt1170-pinfunc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
