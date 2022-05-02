Return-Path: <SRS0=O7CA=VK=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00245C433EF
	for <soc@archiver.kernel.org>; Mon,  2 May 2022 21:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA591C385AF; Mon,  2 May 2022 21:27:06 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7CC0C385A4;
	Mon,  2 May 2022 21:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E7CC0C385A4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id c5-20020a9d75c5000000b00605ff3b9997so5344625otl.0;
        Mon, 02 May 2022 14:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EsdfTRzRsElhBArWgPiV5kB/wKpIPZn5Ogj7LhGJATU=;
        b=1YNC1wt2NzOcZqc/1Ti180+hwJ2+l3ue71IKtgNnbMH9+Yq2MtL/n96+8JJEQEgUNp
         wDuZghHIF3CFZLUadDyy+bb5UoK1j782f9XwIWmubVncSJVdswM2d4mkmx9GsHvm9M7R
         V/njaGp+tJQ3xzQ5Wuh+a8+BVIf5GrXgjFwptcAIC4LMAZJdbKrdL/ui6NJdq63lpXBU
         qhepp1MqUNhoV06TX38Rq8GgVae1QPe4VnxNkIOvqCDO8ex5J8ZEzfvFWf7nXQE9K8mZ
         3O8lyybngt0kejye/NlKarXCmyt89W8JkO8PIlRtP2ytv7ItWcwRZ2LYDvXcZmFXu6cf
         +iqw==
X-Gm-Message-State: AOAM5316P9055FB/xO5nulib3Wl/fZ3KYtOm9JgOzw/yiBj1j0aLqes9
	y5xDfqhMLNhnw46dKJWs6UEFUdZvhg==
X-Google-Smtp-Source: ABdhPJxkBlKrm6SvtSp+hLxpW9sfD1oaQcy4xBqkj3dJZ98/SwK51i5iypx4zzQa3BHjub2l6y5/TQ==
X-Received: by 2002:a9d:172f:0:b0:606:31ed:5d86 with SMTP id i47-20020a9d172f000000b0060631ed5d86mr471566ota.266.1651526824990;
        Mon, 02 May 2022 14:27:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w5-20020a9d70c5000000b0060603221268sm3254695otj.56.2022.05.02.14.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 14:27:04 -0700 (PDT)
Received: (nullmailer pid 1784930 invoked by uid 1000);
	Mon, 02 May 2022 21:27:03 -0000
Date: Mon, 2 May 2022 16:27:03 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, etienne.carriere@st.com, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Marek Vasut <marex@denx.de>, Ahmad Fatoum <a.fatoum@pengutronix.de>, arnd@arndb.de, soc@kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 4/8] dt-bindings: reset: stm32mp15: rename RST_SCMI define
Message-ID: <YnBMp27tB1774s/L@robh.at.kernel.org>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-5-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422150952.20587-5-alexandre.torgue@foss.st.com>

On Fri, 22 Apr 2022 17:09:48 +0200, Alexandre Torgue wrote:
> As we only have one SCMI instance, it's not necessary to add an index to
> the name.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

Acked-by: Rob Herring <robh@kernel.org>
