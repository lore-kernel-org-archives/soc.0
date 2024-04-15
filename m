Return-Path: <SRS0=TMDp=LU=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0FDC4345F
	for <soc@archiver.kernel.org>; Mon, 15 Apr 2024 16:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78437C4AF0E; Mon, 15 Apr 2024 16:52:07 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66DA0C2BD10
	for <soc@kernel.org>; Mon, 15 Apr 2024 16:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 66DA0C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-ddda842c399so3639316276.3
        for <soc@kernel.org>; Mon, 15 Apr 2024 09:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713199925; x=1713804725; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u5nj7t3vt2EbEPLlkWSc/ywApSrSPp8k4DfqheemWX4=;
        b=Z5FV4s7Nl2yEs6N8B9v6VA+lWfT17DwEVFzGeQT8R6529wTSJ4Y60Dg5boMEzFtOem
         mD3Ny0eET9c9tHA+4IWzY9Xx76/qRO6lHVssUyB02AdCAipCybHo7JF8Lhy3Dg6paC/N
         XHdEvFuEFsH0DlyzxRa05jQKWf12OIqcMhaVOYhRnRpaan1eb6Ac2WPx1u+Bg2SUhhPc
         IBFkR49c3scgpkr9559IOyjpvyQJBXakSxq+QZcHVvOgh7iC9DZbC1v3KZJmK3EuDp0o
         IpTmHOw+jUW4aXbrTU4fO0LKsDNkM2Qo/MPRSwx5wc4r1Xv4G+d7OYDFsidOfqkQSSS8
         3lZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713199925; x=1713804725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5nj7t3vt2EbEPLlkWSc/ywApSrSPp8k4DfqheemWX4=;
        b=Ym1kW1QaaW8mdu71cHsZypb7tQcEJ9KgtDq6FWanUx1pZZl3WfAHtx5cZMY+FDirXM
         wg675UKkFF9TRsVSVnKeV6Yk73N+bWujQlyFIK57JcKYF2XluSao9n6bVSSDD0GX8Qan
         8eiQw8DmDwkfBwkVGpDKuXvQr8RiSf+7efepFhcBJhO/aXT4YYNjVYJan+SRoXMaDR/Z
         /YVtMPWNBx7o49gQb8PEvymswOc3xEN9pz2SA3sbDZliX43cgWyslV2xy5TmF0+OogiH
         yJOSSqtz0RXdqvIq1FEiySwsRtAYL5yj9DQjqasqO1q+/a7epD7qebX4EcSDVKR0NFbl
         YOeg==
X-Forwarded-Encrypted: i=1; AJvYcCXF1MdlzQ5uGt89C+2JG7hFH962dsY60haxmLmqHb5oqLdijFX+eM2e89oAQHLnDWdqfshNZf8hBLgWbqKljw==
X-Gm-Message-State: AOJu0Yz7sacN63FvTiN4YiHGLwyyjx8ngFvB8Rf4GQChXIDS6jGMHP3C
	lzYpWQ1bQugryGTc/Y7mou9mL7gnib5q56aIdEkpyQ4EbhQhEnvLYkyQRC99qOUZJKTEtwgbS3d
	zgSAGzjAk74SRObtwyJRs/PuTis4IQMN8rgo4bg==
X-Google-Smtp-Source: AGHT+IFUQH4ONlkcS0+01CEMOIrS9D3xuTmTIKe0INOXof2d+fsMqiJVzA1ER/VV0S5Vp3kzkSBLhneirq6dUQh4r9c=
X-Received: by 2002:a25:9e0b:0:b0:de0:df15:b372 with SMTP id
 m11-20020a259e0b000000b00de0df15b372mr9733585ybq.63.1713199925395; Mon, 15
 Apr 2024 09:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240412222857.3873079-1-robh@kernel.org> <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Apr 2024 19:51:54 +0300
Message-ID: <CAA8EJpqL2T4bJZqtZ9KF=V2NLnFxUjouA6_Hu_H07DofifZaoQ@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
To: Bjorn Andersson <quic_bjorande@quicinc.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh@kernel.org>, soc@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Khuong Dinh <khuong@os.amperecomputing.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Robert Richter <rric@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com, 
	Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-realtek-soc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Apr 2024 at 16:46, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
> [..]
> >  arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
> >  arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
> >  arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
> >  arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
>
> Acked-by: Bjorn Andersson <andersson@kernel.org>

Note, we'd need to override PMU compatibles in sdm636.dtsi and
sdm660.dtsi. Ideally it should come as the same patch.

>
> Regards,
> Bjorn
>


-- 
With best wishes
Dmitry
