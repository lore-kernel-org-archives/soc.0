Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D5DC00A94
	for <soc@archiver.kernel.org>; Mon, 15 Apr 2024 17:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 381A1C4AF12; Mon, 15 Apr 2024 17:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D2EC4AF08;
	Mon, 15 Apr 2024 17:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713200743;
	bh=4a9TlTGikPdPtvIswhMDPVXsOAtTJIQPwslpOZDf9fY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NFy7sX2s3cIUNBRlFl2k/x2C5OHuIvV1olStkLYruXa19OXeY4Re8RAN2kmjkFBeZ
	 1DjxKjU/G8hAzm5Z0QOMxfW9Hp2GYx8iAEMmW7L03g4yn5utz++MTGkIaNYY3hKEp6
	 O9xuJQCk5VE2NdtB1YsmN7ldCQiqUrb3DLDXruLxmstCwXZryyVpkcPIY7SjwJAg6F
	 MYDXmKK7rkAL2bNPdaGhG8V8vwaVZ7qjnONhJuBl1/YNxMRAbc0EZOqol+pI6alrre
	 naT771VJyBzqUPlyZxYajdFYf08ATeKbsVydsactbGDsLyP2FQsHXvjQWN8gRJ7txH
	 RtIsX/QiGu7XQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-518d98b9620so1721807e87.3;
        Mon, 15 Apr 2024 10:05:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbHHMdit9xpYk7kLCYJJnB/fYiVt1+I5dROlYaAVX0DecGID0f3PzS9Ji8ceYobpu8EbkkWCMCW/PVUJBOjxOpA7+2se5pCBAK2Y4Fh/c2cdERRKMwhBZCdjeUkijGhKe4lnHqKrOoNv9mIdRMAhVBlmku9p8wfjO3VeREI19wDl8sSHYhoshF/OVa8mb0YkPLjGrbCZ8vxLwOiaBM4DbKLMQgUiY04hTR2bMGYaD7HBccwTDiYTRU9VqbsXkLuk8yzl718QboZZDKdfiBdO6qFAiXkw+32VZ4L0M8KU50Y7M5qg==
X-Gm-Message-State: AOJu0YzGtU8djCtzrimGNlCATdCc0+JL3nuuidq8zHyIskATO/d8mbSb
	wwuCJ1QGcWA3mm/PEOfQeIEtYIP1ptXwk3UTdPHT+doj+6EsddJRT9JFPMtd4iMLX0oWrK+2EHm
	Diqh4DOyA3yNk3+A6ovZx6Lcq4w==
X-Google-Smtp-Source: AGHT+IGj52gH0/Dg5INd/xZRyWwlGDPcfmpSpbX0KU82iJTE7+TtYLQcTn0dGxCxYIzg49fhJoCRFzAjpf+6SCkqXUk=
X-Received: by 2002:a2e:b0ef:0:b0:2da:320a:68d9 with SMTP id
 h15-20020a2eb0ef000000b002da320a68d9mr3627965ljl.13.1713200741392; Mon, 15
 Apr 2024 10:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240412222857.3873079-1-robh@kernel.org> <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqL2T4bJZqtZ9KF=V2NLnFxUjouA6_Hu_H07DofifZaoQ@mail.gmail.com>
In-Reply-To: <CAA8EJpqL2T4bJZqtZ9KF=V2NLnFxUjouA6_Hu_H07DofifZaoQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 15 Apr 2024 12:05:26 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+q3OLEMT=d8=d9o1D9deKGQ5TAtZg_bgptDPQ1cWcctw@mail.gmail.com>
Message-ID: <CAL_Jsq+q3OLEMT=d8=d9o1D9deKGQ5TAtZg_bgptDPQ1cWcctw@mail.gmail.com>
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

On Mon, Apr 15, 2024 at 11:52=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 15 Apr 2024 at 16:46, Bjorn Andersson <quic_bjorande@quicinc.com>=
 wrote:
> >
> > On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
> > [..]
> > >  arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
> > >  arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
> > >  arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
> > >  arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
> >
> > Acked-by: Bjorn Andersson <andersson@kernel.org>
>
> Note, we'd need to override PMU compatibles in sdm636.dtsi and
> sdm660.dtsi. Ideally it should come as the same patch.

Uh, that's an A for reuse, but an F for readability... It's sdm632 as
well. Will drop sdm630.

Rob
