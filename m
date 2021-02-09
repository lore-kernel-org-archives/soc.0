Return-Path: <SRS0=Axkg=HL=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B02C433DB
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 02:32:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4E02864EC7; Tue,  9 Feb 2021 02:32:53 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 099D164EC6;
	Tue,  9 Feb 2021 02:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 099D164EC6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-oi1-f179.google.com with SMTP id u66so15982986oig.9;
        Mon, 08 Feb 2021 18:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YP9H2kzr/vTSeYjwcofC7D1lobSyVWitvsOWLEGknl4=;
        b=TbmrrX5umR9Y9A85r1p6GNgZpdvA5WXwf9f/Lps+5XbJ+m5lalEfY+d3GIEIe+GBj0
         ILQNcGHKBQ3h80fjRG3Qzm6/LUQj1QpB6dqNFHQ7TJCspTv0mDzBX8fYafiecCKq56H9
         pEu6i/2jQImIb/5L0mA3Xai1nYWqOR7+lboHaTgx9BAkPIzwkCNZWyk61lWK9O7hW9SZ
         AzUBRMbgV6I1TGsHuqTTNO8JatIxtSFG8TuYVJ1RqItRiHaouYNrWf3Y6rvDnp2/ltBC
         pLOEtm0qQA9diVDpnQGQKZTXHw2UONhAsf3yR9Ky9yPym0cdIxHSfeA88KSUSvhnO6C1
         k+Xg==
X-Gm-Message-State: AOAM530CN/IbXiLDpgHpuLKzXL8GhzYWEdptyNC1LIw8nRX1K14rkLmG
	Ju1c2UguMlHjvv6OaqvBpg==
X-Google-Smtp-Source: ABdhPJwTjedOokuNw7WiMMGvYnGm7XHgCJ9N26N5tqJrfhaqNtdCHzRKUaXFrJkQzGWJc6jjHzsyUQ==
X-Received: by 2002:a05:6808:1390:: with SMTP id c16mr1070281oiw.27.1612837972353;
        Mon, 08 Feb 2021 18:32:52 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r4sm1984751oig.52.2021.02.08.18.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 18:32:51 -0800 (PST)
Received: (nullmailer pid 2561689 invoked by uid 1000);
	Tue, 09 Feb 2021 02:32:50 -0000
Date: Mon, 8 Feb 2021 20:32:50 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Michal Simek <michal.simek@xilinx.com>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: add ebang vendor prefix
Message-ID: <20210209023250.GA2561635@robh.at.kernel.org>
References: <20210120194033.26970-1-michael@walle.cc>
 <20210120194033.26970-2-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120194033.26970-2-michael@walle.cc>

On Wed, 20 Jan 2021 20:40:31 +0100, Michael Walle wrote:
> Add vendor prefix for Zhejiang Ebang Communication Co., Ltd.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
