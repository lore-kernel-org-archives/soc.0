Return-Path: <SRS0=kvJR=QD=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD800CD5BA6
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 10:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84DADC4CEC6; Thu,  5 Sep 2024 10:32:09 +0000 (UTC)
Received: from flow2-smtp.messagingengine.com (flow2-smtp.messagingengine.com [103.168.172.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2A69C4CEC4;
	Thu,  5 Sep 2024 10:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D2A69C4CEC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id CE6A5200102;
	Thu,  5 Sep 2024 06:32:06 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Thu, 05 Sep 2024 06:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725532326;
	 x=1725539526; bh=g8q3z8GHO/Kdhs0aj4nHHr1XSaDl73M/bRjVWWsBE8U=; b=
	Nvee0sNb8RqSDM8u/7nxKnOzGz1sKnQC3cCfoiobOIykohgG1x2JtbKVIub3Y1F5
	wlCRSfgit8rAkWdI0T/6WX2tEfJiXw49zVpHtK472bxvI9yvbb4xVwR8ln3XYAka
	YrBhlkQob3U+fNok7bds4tEF5tcF6NObvrJ0gF//y2KPRVdgssq8Kh9BmiVY9ECS
	pSP40l5efDe1aOEc5G1pTWJujCLR1vU4CKW73ZWtGp4QeVZuU23Kt4WNUeYIvxce
	CfnYPlGV1M2082UNFd5MGM11ZbdwjT66AlXPr0lY5dHc5rr6S/v+Fuq0MbSzQPjE
	GYGiwSb1QOeEtnkIkwvv7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725532326; x=
	1725539526; bh=g8q3z8GHO/Kdhs0aj4nHHr1XSaDl73M/bRjVWWsBE8U=; b=Y
	N+DgNVJPS0pwmVL5GmlXe1tNvPCYwpvy+UnAeMloQ0uXWZMxGJ++kCLKFF/QhWSF
	t7adOAho0hRzgHs6xQR1sspGmSdxOFoZbAGrd1ENciaAmqRBTeR0uvx0kr2QHKLC
	+c9PDoZ87DtH8eQjtGkaBfyL26yOnT9bbxtFU6BFmmZPaY+xbakShyk0a8MOd0nf
	i4izU77FfCZSPHsrcOou485n7gUCY9r0nDKDS0SpZJBY5fxIoN2kaG4xgrg6uKOz
	sxmUgNM2Nl1nBcoZ2FOuHhvbl2OnTljwgq89T8nhCFlKci1IkJKInFWonaLOpQp7
	pazETk0EijZETM9qO4d2Q==
X-ME-Sender: <xms:pIjZZkU7mEybxF2m7YOuuzBkYbqQ6kpjHywkBCgLTFczq92PgqKjsQ>
    <xme:pIjZZolWoyPsCsITH8tV59WlDXinr3TLDlYJOdiQuQS3ksbN7NcEch4taGHn2rHGh
    ixbfxf8VU2pp_p6cTs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehledgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeek
    keelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghr
    nhgusgdruggvpdhnsggprhgtphhtthhopeegjedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepghhithesrghpihhtiihstghhrdgvuhdprhgtphhtthhopehkhhhilhhmrghn
    segsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehprghtrhhitghksegslhhuvghrih
    drshgvpdhrtghpthhtoheprhhosggutghlrghrkhestghhrhhomhhiuhhmrdhorhhgpdhr
    tghpthhtohepuggrnhhilhgrsehjihgrgiihghgrrdgtohhmpdhrtghpthhtoheprghnug
    gvrhhsshhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrmheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepjhhohhgrnhdolhhinhgrrhhosehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehsohgtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:pIjZZoZG93cNUR98c3dDTgVzyI55VzGeaRNq1E4Hwb5gjQRNyrVBcw>
    <xmx:pIjZZjXXELoQf7-tMJ4M1NuStL2qA2NyYf5LDQHX2pBc_sBmxoxE1g>
    <xmx:pIjZZukDpfGhfQaS0bMM9ros_H_JNEfHOM11bJrdjWI6J3Vpj2ndCQ>
    <xmx:pIjZZoeceE44cQuGAwE1YBoyXksT9urYAeLPaSnGXSHWsS0f-K0hiA>
    <xmx:pojZZoC51o56Zk3p5URVtUj_Hb8HxxZhy14S88DDX3cTxkf0QcDJfmZ7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9A67A2220071; Thu,  5 Sep 2024 06:32:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 05 Sep 2024 10:31:44 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Bjorn Andersson" <andersson@kernel.org>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Olof Johansson" <olof@lixom.net>, "Kevin Hilman" <khilman@baylibre.com>,
 "Johan Hovold" <johan+linaro@kernel.org>,
 "Dang Huynh" <danct12@riseup.net>,
 "Bjorn Andersson" <quic_bjorande@quicinc.com>,
 "Konrad Dybcio" <konrad.dybcio@linaro.org>,
 "Ajit Pandey" <quic_ajipan@quicinc.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Konrad Dybcio" <quic_kdybcio@quicinc.com>,
 "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>,
 Meng-Bo <linmengbo06890@proton.me>,
 "Naina Mehta" <quic_nainmeht@quicinc.com>,
 "Rayyan Ansari" <rayyan.ansari@linaro.org>,
 "Tengfei Fan" <quic_tengfan@quicinc.com>,
 "Varadarajan Narayanan" <quic_varada@quicinc.com>,
 "Abel Vesa" <abel.vesa@linaro.org>,
 "Alexander Reimelt" <alexander.reimelt@posteo.de>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@somainline.org>,
 =?UTF-8?Q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Nikita Travkin" <nikita@trvn.ru>,
 "Raymond Hackley" <raymondhackley@protonmail.com>,
 "Satya Priya Kakitapalli" <quic_skakitap@quicinc.com>,
 "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>,
 =?UTF-8?Q?Adam_S=C5=82abo=C5=84?= <asaillen@protonmail.com>,
 "Amit Pundir" <amit.pundir@linaro.org>,
 "Ankit Sharma" <quic_anshar@quicinc.com>,
 "Anton Bambura" <jenneron@postmarketos.org>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 "Danila Tikhonov" <danila@jiaxyga.com>,
 "Krishna Kurapati" <quic_kriskura@quicinc.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Ling Xu" <quic_lxu5@quicinc.com>, "Patrick Wildt" <patrick@blueri.se>,
 "Qingqing Zhou" <quic_qqzhou@quicinc.com>,
 "Rajendra Nayak" <quic_rjendra@quicinc.com>,
 "Rob Clark" <robdclark@chromium.org>,
 "Sachin Gupta" <quic_sachgupt@quicinc.com>,
 "Sagar Cheluvegowda" <quic_scheluve@quicinc.com>,
 "Stephan Gerhold" <stephan.gerhold@linaro.org>
Message-Id: <23cb916f-9870-4c5c-bf1d-6a281b99dea0@app.fastmail.com>
In-Reply-To: <20240904215752.24465-1-andersson@kernel.org>
References: <20240904215752.24465-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.12
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Sep 4, 2024, at 21:57, Bjorn Andersson wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
>
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 
> tags/qcom-arm64-for-6.12
>
> for you to fetch changes up to ba728bda663b0e812cb20450d18af5d0edd803a2:
>
>   arm64: dts: qcom: x1e80100: Fix PHY for DP2 (2024-08-30 21:40:28 -0500)

FYI, this had the same issue as the drivers branch, with contents
of the previously merged upstream branch showing up again:

> Johan Hovold (24):
>       arm64: dts: qcom: sc8280xp-crd: disable PCIe perst pull downs
>       arm64: dts: qcom: sc8280xp-crd: clean up PCIe2a pinctrl node
>       arm64: dts: qcom: sc8280xp-x13s: disable PCIe perst pull downs
>       arm64: dts: qcom: sc8280xp-x13s: clean up PCIe2a pinctrl node
>       arm64: dts: qcom: x1e80100-crd: fix PCIe4 PHY supply
>       arm64: dts: qcom: x1e80100: fix PCIe domain numbers
> ...

I assume you also included these to avoid merge conflicts, but if there
are  only a few trivial conflicts, I would normally prefer to resolve
them myself and get a cleaner merge history.

I verified that the commits above are the ones I already merged, rather
than another copy with different commit IDs and merged the branch now.

     Arnd
