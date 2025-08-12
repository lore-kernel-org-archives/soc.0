Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AB22E7F35
	for <soc@lists.linux.dev>; Tue, 12 Aug 2025 09:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990048; cv=none; b=YDBgRSYjcEhrxtLSycciipbMEbXmzQiJ3Sqvcel5toma1wKZgIz4DJTGHc2UCm1m7p77TXpsuU1RRdAVbvjbYfpHnDnX4YhS+Q3X5aiIzi8D8N82wuxvsp0X/HKZ+oxfhm1mbAA2zvMClM2WEYrIW4nDFusO9VXZms0M3DdRbyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990048; c=relaxed/simple;
	bh=nr4/zLMgjwtBkW7NNaGIi8b89hI3W0RdBciJLBm7x6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UyKv+ujMCb8nZbfNmGPkr6vrbZSNH6OUQGBL9SjdgFenAxOXEN7BbV6ZvCkaHlMBzvuzo0IVdSWTVVB++rcpAyRbyVzku9nIjni1Oag0xskTzncbMyP4QGfrzTa4z8lJDOBATX4Wv92nTrE4/bxk5TV5JcF4oJRAsfeTpKQQE2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhtfSRQ2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhtfSRQ2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5X0Pj005393
	for <soc@lists.linux.dev>; Tue, 12 Aug 2025 09:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TcdYyVsr8u2xyDR+M+UHLCKM6ilDd8iFcrZx6NwCMNw=; b=IhtfSRQ2YMp3r9Qb
	QTBakXU39kXnh3NAEBJK+jxPUhNti+qh2TnSA3O6FuXxZMFWJ92mtfpgaYuzpKlM
	79O6emmm+ijVk/GZsDz+7Y0utYD8xhI/HE1GcmNUUDbYPwtTK/pqvfAvkX1MCHXt
	zLgnT0FMJcu8wg830X801jUiQpgV5Zh9XqCh+ADbELn2FnOS9gICrZzQd5ELXDqc
	JMuHjW+zNFuPoGB+sR9PNb5guLJaT/oSku8iZRr5nqLYWea9Y4dIfvAon+7aBHnw
	WWDckRpDvB5IABisZYJyWOoePRF2XmOtgsNh7HDAjsCYrKKntzAOspkZicbfU5RC
	7W6NDg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx5qqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Tue, 12 Aug 2025 09:14:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7092ee7f3cfso13783606d6.1
        for <soc@lists.linux.dev>; Tue, 12 Aug 2025 02:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990044; x=1755594844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TcdYyVsr8u2xyDR+M+UHLCKM6ilDd8iFcrZx6NwCMNw=;
        b=nXKqSpjEAv77tiX/97edwUcJnc0naWK0/dqLh4OENdL3+vp1j414M0lqISu5emOygg
         yDvswiXRsYN8quF6Vt5Yk1pjKQh/2b4Sr3c9ixXmpSmj3bREroiTJVEpffPwjN3bVLwu
         z18Ac+8IFN+bDrqT/eaAvLMQUKAVht5Zi9Gfkpcd46hFd/q9IDx1NknMi6jQfpIksH6r
         S4DYBC+NZvwpgfstB6yfwmvTKs31Tp5VkYnf/c+q7N6gOEjdqsuZXqJiAVtX/NerMwzf
         mQd/OhiLKmB0DVrfeo+1inLzBdzfIcvLApUP8y11QsXjAkpmvRBq1Twl5lXfQT7Ufqaz
         3Pzg==
X-Forwarded-Encrypted: i=1; AJvYcCVv1/suJPzU5DxfcFVJqiM/RyeUoifKErSGWUCZolr+4vcOPONS/Xs5QHMq2i/2iaUSUPk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFsCIwGH7dYLz/siVH3tAU4vUMgXMIHKH71cXAyr3A+3vnMS/E
	u2+5R3rdyUS2YA+d0xdMdAk486SX8tv0VAoW2++pqcq+eQ6dNX8ot6LPFLBMOM38QLvfHot/F6l
	0aek3MLIRLaUgHZSCQUfZbzDfH/Nh4PT7NQJGxON1PD1sEfLxyvPzH/w=
X-Gm-Gg: ASbGncuD9n4Edrp2YyrrsWDUMY1uSWnTGe6mwfhRmGRjarkJ1kEMpC7bvdl526yBxcD
	AZC8UweENz7Enxpaw6KKPdJ9+ABDTqvc5nEPBjkGmOJPnV6NU/aSG7jHO0RHDl7hhtZoYTBzu6h
	i93GumSSd2I6CzhER0eV0yDyyAxf3YqaC0gkAkW6FTIKRi4EsVLsAMpd7mbtgjSzWwiuyVI61Cs
	eQgncka+lE7w3pfX/b7b/p6FlPmmYm4/tNVILkYqm+zOGamBLkXsJokHVGm218UJTJLb3+Q9TXv
	AcqQB1/NhepLi79XXEPEW7zDbJXqn5LpVPpf8/9hZ+XtRgC8NcEjDEknkwD5axv39QbQIFmllwp
	sCfxfs3jKIPMtjBINMg==
X-Received: by 2002:a05:620a:462b:b0:7e6:3c48:408e with SMTP id af79cd13be357-7e860096e15mr26709785a.0.1754990044165;
        Tue, 12 Aug 2025 02:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIPCXaPbFG7yAsR8pzw0t16fLvywO1iDk8kuIeOO1bInlVQuLKav0rw2YYkObsTH0QGuYx8w==
X-Received: by 2002:a05:620a:462b:b0:7e6:3c48:408e with SMTP id af79cd13be357-7e860096e15mr26705885a.0.1754990043559;
        Tue, 12 Aug 2025 02:14:03 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a1251sm2177380166b.30.2025.08.12.02.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:14:02 -0700 (PDT)
Message-ID: <90f4eaaf-2513-4479-8647-b855a72e0e65@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:13:53 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 090/114] clk: qcom: alpha-pll: convert from round_rate()
 to determine_rate()
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Paul Cercueil <paul@crapouillou.net>,
        Keguang Zhang
 <keguang.zhang@gmail.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Yixun Lan <dlan@gentoo.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Michal Simek <michal.simek@amd.com>,
        Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Neal Gompa <neal@gompa.dev>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrea della Porta
 <andrea.porta@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
        asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        soc@lists.linux.dev
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-90-b3bf97b038dc@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-90-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX79tjQnWFs8pG
 9ygVAYY4/Mwxfkg7TrGhApSFb0UHK9p1fjCSikaCecODuq2sgJEnln/oYaF3QNrHSK+jwVczUCl
 FfRpIPWbk3W4KSbIifg8r0OIdC9YJtF1NwIEcIXcj2Kn/Ed53SDlrpsAXjV5Q35d6j590nnXpUP
 KFnDWVN8VOeadJIIq6BGm+QBdLYXoXgsHE5MlTc5XTh29MNrbB2+KznAjNSFtejExYp5nqP550p
 /QPM/vnM+nA9mYns2utGoDVocWvMLql2ryYk3ViIBfl42vRgs5/zu5xrmo3tDfwSM79156WGOKr
 MskSjR0dFl3lsLMFuAjUn+Pn8skSETEHGeGC2nWx/T3gC6yPWg1qoEAjf6Mxl5Ziy8LgChWNB4v
 d8VBYf3O
X-Proofpoint-GUID: -sIsa2eQ41rteWHhiDJEzsAleYTCe57o
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689b05dd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=42SW9st40EnfI9Ma3XoA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: -sIsa2eQ41rteWHhiDJEzsAleYTCe57o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On 8/11/25 5:19 PM, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Note that prior to running the Coccinelle,
> clk_alpha_pll_postdiv_round_ro_rate() was renamed to
> clk_alpha_pll_postdiv_ro_round_rate().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

[...]

> +	req->rate = DIV_ROUND_UP_ULL((u64) req->best_parent_rate, div);

space after typecast is 'eeeh'

but the rest looks good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
