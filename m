Return-Path: <SRS0=+ssV=RU=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B106C433EF
	for <soc@archiver.kernel.org>; Tue,  4 Jan 2022 19:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 164CEC36AED; Tue,  4 Jan 2022 19:07:47 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 90335C36AE9;
	Tue,  4 Jan 2022 19:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 90335C36AE9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id o3-20020a9d4043000000b0058f31f4312fso46264843oti.1;
        Tue, 04 Jan 2022 11:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jZNE5mx7rEhZ7Le90Os2oa7/MAEiBxj4U8DgdPt451Q=;
        b=sydyatnVtUVuIW6LUz6lWNjtlDzoG2gLsWr6jpa2+MmUyOPkZpaRwo8dX88x/U9L3I
         AeTB+Ew09quQkIg7ieKefghbxUy7d5yyyPyxdJYY7NL79Lx91IoAp7EmI1d6TUG4qvK5
         1UvqyaP4dt4IzOtmWaG2h0DxrKLpySs6Upj22J52FqfP+5diP0M9mTOYQeejiIc6R4bi
         VaySq1N2iE6R12HO9JpkX1QNglz/4hpog2thWo+x9QJPzPuBGHylWw4hdAtbwrJeWDuo
         gczVQPlLq3V3LfAAjsoX+WuCMGrL4fFWtZvjvWwjE99jXnh4HGUFp0Z9cZb2wzin0/tO
         hj7g==
X-Gm-Message-State: AOAM5339MwTs8AMaJjcDNzOLa14CGgRes5k/IPri3F9opzbKYQ/eQrVj
	VYSzJtQFYQJlGSmLzES3eQ==
X-Google-Smtp-Source: ABdhPJytfvV+hwtkFJBZUQ66jDEOQUh9tIx/8nd34uFsnLCf+TCrqub3U7DjefxZSJjRwIxrm+Ij8A==
X-Received: by 2002:a9d:6a7:: with SMTP id 36mr36888976otx.260.1641323265684;
        Tue, 04 Jan 2022 11:07:45 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v25sm7490806oof.18.2022.01.04.11.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 11:07:45 -0800 (PST)
Received: (nullmailer pid 1228819 invoked by uid 1000);
	Tue, 04 Jan 2022 19:07:43 -0000
Date: Tue, 4 Jan 2022 13:07:43 -0600
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Mr.Bossman075@gmail.com, adrian.hunter@intel.com, kernel@pengutronix.de, nobuhiro1.iwamatsu@toshiba.co.jp, devicetree@vger.kernel.org, ulf.hansson@linaro.org, sboyd@kernel.org, soc@kernel.org, linux-imx@nxp.com, abel.vesa@nxp.com, olof@lixom.net, jirislaby@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, mturquette@baylibre.com, giulio.benetti@benettiengineering.com, linus.walleij@linaro.org, festevam@gmail.com, linux@armlinux.org.uk, shawnguo@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, stefan@agner.ch, linux-serial@vger.kernel.org, s.hauer@pengutronix.de
Subject: Re: [PATCH v7 3/7] dt-bindings: imx: Add clock binding for i.MXRT1050
Message-ID: <YdSa/7BZBDJO3J0V@robh.at.kernel.org>
References: <20220103233948.198119-1-Mr.Bossman075@gmail.com>
 <20220103233948.198119-4-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220103233948.198119-4-Mr.Bossman075@gmail.com>

On Mon, 03 Jan 2022 18:39:44 -0500, Jesse Taube wrote:
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Add the clock binding doc for i.MXRT1050.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> [Giulio: added all clocks up to IMXRT1050_CLK_USBOH3]
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> [Jesse: added clocks from IMXRT1050_CLK_IPG_PDOF to
> IMXRT1050_CLK_DMA_MUX and moved IMXRT1050_CLK_END on]
> ---
> V1->V2:
> * Nothing done
> V2->V3:
> * Added GPT binding
> V3->V4:
> * Change License to MIT or GPL-2
> V4->V5:
> * Nothing done
> V5->V6:
> * Nothing done
> V6->V7:
> * Fix typo in numbering
> * Remove GPT
> ---
>  include/dt-bindings/clock/imxrt1050-clock.h | 72 +++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 include/dt-bindings/clock/imxrt1050-clock.h
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

