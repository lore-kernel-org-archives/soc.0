Return-Path: <SRS0=A/H+=SD=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABB9C433F5
	for <soc@archiver.kernel.org>; Wed, 19 Jan 2022 14:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31C4AC36AE3; Wed, 19 Jan 2022 14:05:34 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66CACC004E1;
	Wed, 19 Jan 2022 14:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 66CACC004E1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id i7-20020a9d68c7000000b0059396529af8so3219804oto.4;
        Wed, 19 Jan 2022 06:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bA4lXk3bs4g992PO5jXPShXJCU4RdXIJFPt9TWuZvi8=;
        b=VeWgoY3xLK2OR31jyHOqF0RvlAiDMuRExoQ9eIPv9Ciznvmb/7dkiYP6ZVxx+2iAq5
         TvSWrrAQZuwS4sCQFLH+DvUnJxnCLwwTnDi2lbUvyU0c/XnkOya0b4MPiqDKUlNDP/5+
         WokuFPjaxHMjqDuG9HVqUs62EYnb/fhlmgHsgvTkIAoOzlAt87rxsgGM/gnhb4BqP9BQ
         bQE3nJePsd6C5MQKUpiHUuFZfQ/CWO6J6kAwQ/4dyFs2u4zJNk3FLFQ9G1Xhpst9bV/T
         nePFwiZiDNMoXkL0Cs0vY6wyID+DTg2I/aFpEk982h9fLfoeqj6ETl65W/+dA0PjJMub
         HeLw==
X-Gm-Message-State: AOAM5313Xyzjzr/Ci9PzGh4qoLsD42r2E37MYaVUteppS0Sm7LRkiRP9
	fanfBSh6LDqs67EgkbFwpA==
X-Google-Smtp-Source: ABdhPJz+nPpKZ1wx/9MZBe3c2PWe70YAUIasbvLv9Mx8j0isWcefeBYdwrdxEdCzSxpX+Pr8JGIYZw==
X-Received: by 2002:a9d:e88:: with SMTP id 8mr6044843otj.276.1642601132546;
        Wed, 19 Jan 2022 06:05:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 186sm10018818oig.28.2022.01.19.06.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 06:05:31 -0800 (PST)
Received: (nullmailer pid 3480173 invoked by uid 1000);
	Wed, 19 Jan 2022 14:05:27 -0000
Date: Wed, 19 Jan 2022 08:05:27 -0600
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: aisheng.dong@nxp.com, nobuhiro1.iwamatsu@toshiba.co.jp, Mr.Bossman075@gmail.com, linux-kernel@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, gregkh@linuxfoundation.org, adrian.hunter@intel.com, abel.vesa@nxp.com, linux-serial@vger.kernel.org, shawnguo@kernel.org, olof@lixom.net, giulio.benetti@benettiengineering.com, linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org, linus.walleij@linaro.org, festevam@gmail.com, sboyd@kernel.org, linux@armlinux.org.uk, mturquette@baylibre.com, robh+dt@kernel.org, ulf.hansson@linaro.org, stefan@agner.ch, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, soc@kernel.org, jirislaby@kernel.org, linux-imx@nxp.com, s.hauer@pengutronix.de
Subject: Re: [PATCH v8 2/7] ARM: dts: imxrt1050-pinfunc: Add pinctrl binding
 header
Message-ID: <YegapycPxDdgTlXQ@robh.at.kernel.org>
References: <20220111212606.2072669-1-Mr.Bossman075@gmail.com>
 <20220111215415.2075257-1-Mr.Bossman075@gmail.com>
 <20220111215415.2075257-3-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111215415.2075257-3-Mr.Bossman075@gmail.com>

On Tue, 11 Jan 2022 16:54:10 -0500, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add binding header for i.MXRT1050 pinctrl device tree.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> [Jesse: move pinfunc from dt-bindings to dts folder]
> ---
> V1->V2:
> * Move pinfunc from dt-binding to dts
> * Change subject and description
> * Change licence to "GPL-2.0+ OR MIT"
> V2->V3:
> * Change License comment style
> V3->V4:
> * Nothing done
> V4->V5:
> * Nothing done
> V5->V6:
> * Nothing done
> V6->V7:
> * Nothing done
> V7->V8:
> * Nothing done
> ---
>  arch/arm/boot/dts/imxrt1050-pinfunc.h | 993 ++++++++++++++++++++++++++
>  1 file changed, 993 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imxrt1050-pinfunc.h
> 

Acked-by: Rob Herring <robh@kernel.org>
