Return-Path: <SRS0=O7CA=VK=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD1FC433F5
	for <soc@archiver.kernel.org>; Mon,  2 May 2022 21:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1EC7C385AF; Mon,  2 May 2022 21:28:37 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F04FC385A4;
	Mon,  2 May 2022 21:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1F04FC385A4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id s131so16502794oie.1;
        Mon, 02 May 2022 14:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aWRyyqTX1zgpUL0i+w8d1Ou1tFF0ewiHqxv686F2LGk=;
        b=AfGdL6w9aJLFcjVSkeef+TXi/wjli7Rh56Ls3zxhDQayVH/KM9/9nVNQjo9gBvfQBY
         sArRHQU28Ts+yeqY6YBXylEVqNppWNHunlgaJovVEG998IC54ZD6ba1g/vP3UId/+YtC
         fiJn1Ep3nXCQut0kLSShU/bXoAbiFg5rToAT3uIDfEI2SPw4roiGVkN7l0WnChub1yBq
         F9RqT7lLAeDPifp3wDxQpAKFQ0ej0pEUhDXhOvgv28nnlSkiiDIjlz0Nw7uAV4T8eO9a
         3VIYFx3Vl0hQvFIB7RzwqVLeWnT0spT/K76nW+UUEeVUgxZr9CoECdSkKPW/wDoEQzMV
         6P3w==
X-Gm-Message-State: AOAM530OsFyo+w6fZaFTP+/asevDbPd/9jsXyfu9yTktd+/HEn9ZPleK
	tCamGS8KLvwM2RKDqeE4V9799u0kVg==
X-Google-Smtp-Source: ABdhPJzuZVJjvpvlPD9utsP/MMvXGt+bpD1i+qtjarMTrHxsWFFkdFazKHKJ+54WhwWRfMXuHv14FQ==
X-Received: by 2002:a05:6808:1526:b0:323:1194:d3bf with SMTP id u38-20020a056808152600b003231194d3bfmr535917oiw.120.1651526916142;
        Mon, 02 May 2022 14:28:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k3-20020a9d7dc3000000b0060603221261sm3416202otn.49.2022.05.02.14.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 14:28:35 -0700 (PDT)
Received: (nullmailer pid 1787413 invoked by uid 1000);
	Mon, 02 May 2022 21:28:34 -0000
Date: Mon, 2 May 2022 16:28:34 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de, etienne.carriere@st.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, linux-stm32@st-md-mailman.stormreply.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marex@denx.de>, robh+dt@kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>, linux-kernel@vger.kernel.org, soc@kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 7/8] dt-bindings: arm: stm32: Add SCMI version of STM32
 boards (DK1/DK2/ED1/EV1)
Message-ID: <YnBNAnlIvF6ujYWg@robh.at.kernel.org>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-8-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422150952.20587-8-alexandre.torgue@foss.st.com>

On Fri, 22 Apr 2022 17:09:51 +0200, Alexandre Torgue wrote:
> Add a "secure" version based on SCMI of STM32 boards. Only boards
> provided by STMicroelectronics are concerned:
> 
> -STM32MP157A-DK1
> -STM32MP157C-DK2
> -STM32MP157C-ED1
> -STM32MP157C-EV1
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

Acked-by: Rob Herring <robh@kernel.org>
