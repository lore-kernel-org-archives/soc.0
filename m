Return-Path: <SRS0=TMDp=LU=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB41C4345F
	for <soc@archiver.kernel.org>; Mon, 15 Apr 2024 17:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DDCBC4AF0B; Mon, 15 Apr 2024 17:41:50 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 388F8C2BD10
	for <soc@kernel.org>; Mon, 15 Apr 2024 17:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 388F8C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc74435c428so3388235276.2
        for <soc@kernel.org>; Mon, 15 Apr 2024 10:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713202908; x=1713807708; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYgIyvMvRWICpRScbQV/k/jY5uYOgDdkXOWDfquSjCo=;
        b=mOCmnoPkJB7nARWoxkv3ztAHJeMz52v/CcDSsYJOCGa68Us8AYCA+h/xx0/LveuOay
         COfUun7NIluglJl4hKM/WEybwaoFVRYLFH08mr5TrV9vGC1PoAFVrRZKHlKOxnzL22dz
         2TLYXjZ4jbYjoa3HGIkXxb7jndR0vJo8PCTiO3zk+tdY00AX8EFGyLt/6hg9tnlq2yHf
         Jhuv4lDrukYRyBRBMICRIh1fj4tbh07K2IbU8pLw1Ulp4smtwNAySHgq0ok9pQ71CKlL
         uc+fMrtAKlQWJTP+kgl9GOBEIbch/8uNq7TKlCYU6K7kQSQiLJIFIrFGORtlU06yL1ck
         q17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713202908; x=1713807708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYgIyvMvRWICpRScbQV/k/jY5uYOgDdkXOWDfquSjCo=;
        b=NqCTPHERCVyDqthvYiq8woiphI7yjNRYjeFU5Cq68S3wjJbEYOHL5W1gemhH1au6qZ
         CApGe0O0p1SF/pxo37hCdgNVwt70DPLXeylO/vWE2p7UzYxDwusMJaLqLN61xwx5tZO0
         JjAVXDYzHzeGAVK+BLa91+y1ehZQlDm2ku0cs45/0bS95EqSQ/DNuBofwFXDYWvBL/4S
         fwnnBMXUPoYK7meW22KurgR5+7cn+tyoaceTQxR6B+xLKDtFQvk0fd0MnOu0mvsTDKFa
         zWZegNsgT7euUTwca28/3o39a3I62yLP5urD8kNYbtWRoaRO1SnJG7k9aaKLoz3B9jhm
         qA/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKVt2xhSDAr9XUKOD5G0Evkaol48UOv+r2LfVjmZVnJfVZJ+DQ3TiHJCrLOfE3SK5Y+IWPf/8NYdezZ2Xm0g==
X-Gm-Message-State: AOJu0YyFL+Dq7M8+Fok2bll0KbWgnCZonX4FAW0ijokhC8v5zr8wmmB2
	V8u6xL2N4vAHHrgga2MLo3wXuyvj5a3xo2KIuOKLVq7fxWZI08fANYtdmbvxVnsweuL4IKW02Yz
	undFISIq0N194KjBM7S6krZKRoPURo/jkymU25g==
X-Google-Smtp-Source: AGHT+IHKpNfr2TaUgVv6Ugvchn9mUOD77xP6+GIEtmI5RLKRLLZLr1EmobTo6CX82MQ9pJIWGNHcl6abRXCvRtZsfeM=
X-Received: by 2002:a25:80c6:0:b0:dcb:aa26:50fe with SMTP id
 c6-20020a2580c6000000b00dcbaa2650femr10533953ybm.15.1713202908173; Mon, 15
 Apr 2024 10:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240412222857.3873079-1-robh@kernel.org> <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqL2T4bJZqtZ9KF=V2NLnFxUjouA6_Hu_H07DofifZaoQ@mail.gmail.com>
 <CAL_Jsq+q3OLEMT=d8=d9o1D9deKGQ5TAtZg_bgptDPQ1cWcctw@mail.gmail.com> <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
In-Reply-To: <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Apr 2024 20:41:36 +0300
Message-ID: <CAA8EJporYZBfDoN6m0Wu2wGqq=Y+TskNCguMOHtDAz05eXS6LA@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, soc@kernel.org, 
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
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Apr 2024 at 20:15, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Apr 15, 2024 at 12:05=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
> >
> > On Mon, Apr 15, 2024 at 11:52=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Mon, 15 Apr 2024 at 16:46, Bjorn Andersson <quic_bjorande@quicinc.=
com> wrote:
> > > >
> > > > On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
> > > > [..]
> > > > >  arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
> > > > >  arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
> > > > >  arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
> > > > >  arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
> > > >
> > > > Acked-by: Bjorn Andersson <andersson@kernel.org>
> > >
> > > Note, we'd need to override PMU compatibles in sdm636.dtsi and
> > > sdm660.dtsi. Ideally it should come as the same patch.
> >
> > Uh, that's an A for reuse, but an F for readability... It's sdm632 as
> > well. Will drop sdm630.
>
> Actually, aren't those Kryo cores just Cortex-A53 derivatives? So the
> A53 PMU compatible is an improvement over the generic one still. We
> can't just add kryo260-pmu compatibles because that breaks
> compatibility. We could have a fallback, but then that introduces a
> pattern we don't want.

I think it is believed that Gold cores are A73-derivatives.

--=20
With best wishes
Dmitry
