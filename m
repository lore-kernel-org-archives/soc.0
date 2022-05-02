Return-Path: <SRS0=O7CA=VK=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F20C433F5
	for <soc@archiver.kernel.org>; Mon,  2 May 2022 21:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C2F37C385AC; Mon,  2 May 2022 21:26:54 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12A66C385A4;
	Mon,  2 May 2022 21:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 12A66C385A4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-deb9295679so15517595fac.6;
        Mon, 02 May 2022 14:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jUXadxcBM2wGghQUZGspLXPv1H+K2sEgrmrW9LXrYH4=;
        b=GAJB5PTf0TWuh3fE1futsL9Ejs19rFLE7WoVABje4OGAJMWMMPjx6TjCzQkOeEeRoB
         7FhFlqonG5I+AfbdviHoWC34uiNdKM8+HmfsGmN/crQiiewjk7c4X1Zk5KetRVgpux7y
         6OQboZoAasWSyXpJTQO2w9HHDWRSe2g2uIBd0y5T7ro6Rp9ULR/CblgVLiVVQVyJT7Zr
         G6dp51t4ux7hoj2eA9d105WSU9pj8gQqTOGCPrR95daXbRgyBJbJh1U0d60q3/w+0yRv
         8MlUXZj+y8z+wAgNjQeICINZQg2bzg7MqlCQ2ome170QUB0FtkfJsRQK/vs/VpMbimKQ
         /4rQ==
X-Gm-Message-State: AOAM531p8z2r4G4EH14dDbBvf/85VR2RMJGWq90A48x3e8tZoF+IrQfX
	RYnG1yIBCROVUNRlumMu/Q==
X-Google-Smtp-Source: ABdhPJy5aexT9fpRtVRW+BykQHq+euRFdmPRG6US0k26rcVqaqzGKoPFTWQt8OnGoRceqsXjqE4Vzg==
X-Received: by 2002:a05:6870:969e:b0:ed:9e77:8eba with SMTP id o30-20020a056870969e00b000ed9e778ebamr516885oaq.269.1651526813128;
        Mon, 02 May 2022 14:26:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n44-20020a056870822c00b000e686d13894sm6244497oae.46.2022.05.02.14.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 14:26:52 -0700 (PDT)
Received: (nullmailer pid 1784491 invoked by uid 1000);
	Mon, 02 May 2022 21:26:51 -0000
Date: Mon, 2 May 2022 16:26:51 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, soc@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, arnd@arndb.de, linux-kernel@vger.kernel.org, Marek Vasut <marex@denx.de>, Ahmad Fatoum <a.fatoum@pengutronix.de>, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, etienne.carriere@st.com, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 3/8] dt-bindings: clock: stm32mp15: rename CK_SCMI define
Message-ID: <YnBMm7wE5/Jz6N3l@robh.at.kernel.org>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-4-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422150952.20587-4-alexandre.torgue@foss.st.com>

On Fri, 22 Apr 2022 17:09:47 +0200, Alexandre Torgue wrote:
> As we only have one SCMI instance, it's not necessary to add an index to
> the name.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

Acked-by: Rob Herring <robh@kernel.org>
