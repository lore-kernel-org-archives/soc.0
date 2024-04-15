Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EEDC4345F
	for <soc@archiver.kernel.org>; Mon, 15 Apr 2024 17:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E183C4AF19; Mon, 15 Apr 2024 17:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC17DC4AF0A;
	Mon, 15 Apr 2024 17:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713201349;
	bh=clBNt8e+6YrryyfPUqSdkx19pn4NeG8mB3JuyFyvw8c=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=n1+h7fY66wIyhXmDqUDbVIEh8cPkMuXLXIaQeZLl3QqSWH7AwxVUPaTqyeqFQd11N
	 lk4Wnqb2wXohrO21GbQMtoQLaQQfQBun9U+Q0IcbgncTpl1hpEqRYg3rG629cPc7hj
	 hVdsVz4IEGHkUyahKyM4VOHTRNcIRKIr32tnze8VMtzQkRozDIhMuyeNzju7Juuxnn
	 +VveOPAflqreRNMQ/ufQ0MfwU/t6dVS5quyLB63EESLuehj4YVLr2pb6S9OiPJfstr
	 nRWV+TeTExmbN1EEkEighfKKJgIBQ4awbBYL6Xi8yEeMv62V6ujiXkASNPnlfhYeFl
	 xf1nDgFeS4WmA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-518931f8d23so2461986e87.3;
        Mon, 15 Apr 2024 10:15:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSgzSxgvxrHB5lDsbIUgbdzENrgjQrjAsdXoMEldeDgqjePw3z7GGjvayM8nfQumgt3lEGcYktyEmBfrZQzHgLaX2z4GT6OGXJKgv83oEZtEumkJ0mufKK5ekkRlOICfBWrGXbF/U00eFzqt4gHNu1v6YVcQqsDm0AspKjHbeNKeK8GHsMF+uMobQ7IvEM/sA2DwO71G6E/hsLayARhQ4uWIqfqgP73hPqgdAnnwU5Rz+9KhMRLs83Tf5OUSG9bVLY/AW8BP8ipSeWDlJn6ZL/ZQl/nwPRWeJuZ074HWW0AN/6nQ==
X-Gm-Message-State: AOJu0YxFC1F9yoHbPnnJFFKTdou7glZk6Rv0/WVwmASoekvczoVwyCMJ
	72YswPnm6ISOuakm1egy5hnKXucMZEsp0IqogfqlzhQ/cpRiB1VpGInGxB5Xd4zjSWSSCOxjWnA
	vw6xTtTAkKaTiVa6iCx/GMOBoCQ==
X-Google-Smtp-Source: AGHT+IEkz26w525DUde0Uob20fmQI4fd4Chc0AN6DRGivhpSGWQdBtr0Y20V2JMzBwteB/hWf3vT168YMa0bRGYd8lo=
X-Received: by 2002:ac2:41c6:0:b0:516:7738:bd5c with SMTP id
 d6-20020ac241c6000000b005167738bd5cmr6496177lfi.4.1713201348179; Mon, 15 Apr
 2024 10:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240412222857.3873079-1-robh@kernel.org> <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqL2T4bJZqtZ9KF=V2NLnFxUjouA6_Hu_H07DofifZaoQ@mail.gmail.com> <CAL_Jsq+q3OLEMT=d8=d9o1D9deKGQ5TAtZg_bgptDPQ1cWcctw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+q3OLEMT=d8=d9o1D9deKGQ5TAtZg_bgptDPQ1cWcctw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 15 Apr 2024 12:15:34 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
Message-ID: <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Mon, Apr 15, 2024 at 12:05=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Mon, Apr 15, 2024 at 11:52=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, 15 Apr 2024 at 16:46, Bjorn Andersson <quic_bjorande@quicinc.co=
m> wrote:
> > >
> > > On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
> > > [..]
> > > >  arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
> > > >  arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
> > > >  arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
> > > >  arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
> > >
> > > Acked-by: Bjorn Andersson <andersson@kernel.org>
> >
> > Note, we'd need to override PMU compatibles in sdm636.dtsi and
> > sdm660.dtsi. Ideally it should come as the same patch.
>
> Uh, that's an A for reuse, but an F for readability... It's sdm632 as
> well. Will drop sdm630.

Actually, aren't those Kryo cores just Cortex-A53 derivatives? So the
A53 PMU compatible is an improvement over the generic one still. We
can't just add kryo260-pmu compatibles because that breaks
compatibility. We could have a fallback, but then that introduces a
pattern we don't want.

Rob
