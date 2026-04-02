Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A5835F600
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 22:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775168802; cv=none; b=VDLm2s50U7sf0HvLwXjQK/RGvwjFKR9c7yKsUlI2QFJi5fP7CUnS2mz1bAhhx+Si+Ib4qXFcY+3BXx+YxXVor1MXLITRp0DFXPt5XoCrs0e06zlK4hFllOjnbgLDQV2fHEfcsMPHIjCC1/h80A/8RlDn2s+r6vm+d9Z9dZE9nDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775168802; c=relaxed/simple;
	bh=xuE0nbuz89YhSuXlJsIeCkEvDlvpiZVgguLnPv51tXM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oWW12MJcSLMIrApsk74XxCnyIPZLjjj4MgAmo1a7y1CcExNU7i4xotms7ip09UWG8N8QFZ7fVfJv+W5YCTy1PzSClTLRhRpG/0r23agcg2o+7T9OiHpTzCO3fb9krXaXPqqEntthWdVeJOKGSE0dS6HypN6yLUrhBf/9rg/qIk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Y8aaXOxM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WcX0a/g7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Y8aaXOxM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WcX0a/g7"
Received: by smtp.kernel.org (Postfix)
	id 45DA9C2BCAF; Thu,  2 Apr 2026 22:26:42 +0000 (UTC)
Received: from flow-b4-smtp.messagingengine.com (flow-b4-smtp.messagingengine.com [202.12.124.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05FA7C116C6;
	Thu,  2 Apr 2026 22:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 05FA7C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 8960613000BC;
	Thu,  2 Apr 2026 18:26:38 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 02 Apr 2026 18:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775168798;
	 x=1775175998; bh=Tajybt9McjsIcQXBo1ozRuz16LHJC8kH16yiXVs6C0E=; b=
	Y8aaXOxMJeqFI5ZVijNMfP1OnPj481LgeBNMYpkZN+TKWwDTvsykWuOKjNeJyaNT
	455VdQPG/4+TTq9j20xfMQWwAZyLpfHHJTJDsE5fdJwU2IaXVMZNPq+qd0+2yvek
	3tMQMHXMY0LTD0YF7kcHZi9KZVJllKNOTGC5J/KXOKgAm+o5ftVVAEq/yu44+kGn
	RMCPBUzYpOPSDIXbrBmDspmPmU/OpHflCC0smTRvRbWMK+SkSha0LLfEs0LBsysn
	TdjN6MdyRCc+5eRqHArNQ4b/jsWTQxCDUfTrw3ABzZSe1NJ6xoZa/p7WA23NcLxA
	AkXb+E0cTMV4kSOEQvIjfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775168798; x=
	1775175998; bh=Tajybt9McjsIcQXBo1ozRuz16LHJC8kH16yiXVs6C0E=; b=W
	cX0a/g7tjoGtGmjUwh04P73GMGD/apVLw0VOQLxN2N22WGXUvb6QxFiH7vpY8/+p
	6ewq288gRBD1zsDLsjED4IlPC6UCSkTno2oYoGmjwt/Yk7ffUAwptisjC4WqZjUL
	hu1jC/xeC41XT2jXc0DXjrjEr9s9fD9qk7C7RYAVKLbDuGT+GwfrMvMGU91ukabI
	gzWwz5P64iOqGywLlBu5xRvWrOjD/vYfM/aToYZiwlhUYU8qsrVLgd3bGQ5+7yhD
	4SKAt7twyrZJ5fEgjKjKR93iJc0EtpkIqwGZIfNHUu41T2UDHsgga4arhUQVClx5
	JeHb0N+sQS3j+Q5IYj8yg==
X-ME-Sender: <xms:He3OaYlWa8oXXPsd6CUlPX7xA8IjrMKqdnt_kWgzBmPrpJHoU8seWA>
    <xme:He3OaSrCTQ92DFN21KWtjmtB7LVkNZA2uFR60hsHR5zbN7i8fL6lREYPjoEQc_z5d
    tx8hBNghRMivtKjvZowoVkGjqRAELorhwfBov6ocA1yW5mhk7hmAcs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefhnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopeehtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhdrmhgvrhgvuhesrg
    hrughuihhnohdrtggtpdhrtghpthhtohepthhosghirghsrdhhvghiuggvrhestggrnhho
    nhhitggrlhdrtghomhdprhgtphhtthhopehrohhshhesuggvsghirghnrdhorhhgpdhrtg
    hpthhtoheplhhutggrrdifvghishhssehfrghirhhphhhonhgvrdgtohhmpdhrtghpthht
    ohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehjge
    hgkeihjeesghhmrghilhdrtghomhdprhgtphhtthhopehmrghilhhinhhgrhgrughirghn
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhithhlthhlrghtlhhtlhesghhmrghilh
    drtghomhdprhgtphhtthhopehmohhrfheftdekleesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:He3OabaMASZw__3o_c38fgM4A89YAhhugRh4zQKcNEjUSoTRst9fLg>
    <xmx:He3OaRwuyWy4PFrheal1P94zcHHOxGK8yVnul5dyPd085fGjycVUFg>
    <xmx:He3OaYTx1QE_GbLg2k4AWYWfPHDGYC5sO6cO_f1xHVjzrn-fMs8Pxg>
    <xmx:He3OaXqqMDq4GIwBR15PsMWs1eV9TcsjfoHzuJFHGacc6_nexPbAow>
    <xmx:Hu3Oaa4sJuEpQ6jsQVXHy_I2QRhCRC1kUUCqpBkkiu5z5YDavhWIGE55>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4CD50700065; Thu,  2 Apr 2026 18:26:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A0iuDSTykP6k
Date: Fri, 03 Apr 2026 00:26:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bjorn Andersson" <andersson@kernel.org>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 =?UTF-8?Q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 "Luca Weiss" <luca.weiss@fairphone.com>,
 "Abel Vesa" <abel.vesa@oss.qualcomm.com>,
 "Swati Agarwal" <swati.agarwal@oss.qualcomm.com>,
 "Val Packett" <val@packett.cool>,
 "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>,
 "Loic Poulain" <loic.poulain@oss.qualcomm.com>,
 "Biswapriyo Nath" <nathbappai@gmail.com>,
 "David Heidelberg" <david@ixit.cz>,
 "Jingyi Wang" <jingyi.wang@oss.qualcomm.com>,
 "Md Sadre Alam" <quic_mdalam@quicinc.com>,
 "Nihal Kumar Gupta" <quic_nihalkum@quicinc.com>,
 "Taniya Das" <taniya.das@oss.qualcomm.com>,
 "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>,
 "Yijie Yang" <yijie.yang@oss.qualcomm.com>,
 "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>,
 "Jens Glathe" <jens.glathe@oldschoolsolutions.biz>,
 "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>,
 "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>,
 "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Pankaj Patil" <pankaj.patil@oss.qualcomm.com>,
 "Paul Adam" <adamp@posteo.de>,
 "Pradeep P V K" <pradeep.pragallapati@oss.qualcomm.com>,
 "Pragnesh Papaniya" <pragnesh.papaniya@oss.qualcomm.com>,
 "Roger Shimizu" <rosh@debian.org>,
 "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 "Tobias Heider" <tobias.heider@canonical.com>,
 "Xilin Wu" <wuxilin123@gmail.com>, "Abel Vesa" <abelvesa@kernel.org>,
 "Ayushi Makhija" <quic_amakhija@quicinc.com>,
 "Canfeng Zhuang" <canfeng.zhuang@oss.qualcomm.com>,
 "Erikas Bitovtas" <xerikasxx@gmail.com>,
 "Jie Gan" <jie.gan@oss.qualcomm.com>,
 "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>,
 "Odelu Kukatla" <odelu.kukatla@oss.qualcomm.com>,
 "Petr Hodina" <petr.hodina@protonmail.com>,
 "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>,
 "Raymond Hackley" <raymondhackley@protonmail.com>,
 "Sarthak Garg" <sarthak.garg@oss.qualcomm.com>,
 "Sibi Sankar" <sibi.sankar@oss.qualcomm.com>,
 "Sushrut Shree Trivedi" <sushrut.trivedi@oss.qualcomm.com>,
 "Umang Chheda" <umang.chheda@oss.qualcomm.com>,
 "Wesley Cheng" <wesley.cheng@oss.qualcomm.com>,
 "Xin Liu" <xin.liu@oss.qualcomm.com>,
 "Yuanjie Yang" <yuanjie.yang@oss.qualcomm.com>,
 "Aaron Kling" <webgeek1234@gmail.com>,
 "Aleksandrs Vinarskis" <alex@vinarskis.com>,
 "Alexander Koskovich" <AKoskovich@pm.me>,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Bjorn Andersson" <bjorn.andersson@oss.qualcomm.com>,
 "Christopher Obbard" <christopher.obbard@linaro.org>,
 "Gabor Juhos" <j4g8y7@gmail.com>,
 "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Gergo Koteles" <soyer@irl.hu>, "Gianluca Boiano" <morf3089@gmail.com>,
 "Hongyang Zhao" <hongyang.zhao@thundersoft.com>,
 "Janaki Ramaiah Thota" <janaki.thota@oss.qualcomm.com>,
 "Jyothi Kumar Seerapu" <jyothi.seerapu@oss.qualcomm.com>,
 KancyJoe <kancy2333@outlook.com>,
 "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>,
 "Le Qi" <le.qi@oss.qualcomm.com>,
 "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>,
 "Manaf Meethalavalappu Pallikunhi" <quic_manafm@quicinc.com>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>,
 "Max McNamee" <maxmcnamee@proton.me>,
 "Pengyu Luo" <mitltlatltl@gmail.com>,
 "Riccardo Mereu" <r.mereu@arduino.cc>,
 "Richard Acayan" <mailingradian@gmail.com>,
 "Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>,
 "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>,
 "Wei Deng" <wei.deng@oss.qualcomm.com>,
 "Wei Zhang" <wei.zhang@oss.qualcomm.com>,
 "Xueyao An" <xueyao.an@oss.qualcomm.com>,
 "Yedaya Katsman" <yedaya.ka@gmail.com>,
 "Zijun Hu" <zijun.hu@oss.qualcomm.com>
Message-Id: <2c5402a1-9724-4fb1-bd31-6e8d133f3b88@app.fastmail.com>
In-Reply-To: <20260401142242.1068620-1-andersson@kernel.org>
References: <20260401142242.1068620-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 1, 2026, at 16:22, Bjorn Andersson wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 
> tags/qcom-arm64-for-7.1
>
> for you to fetch changes up to b683730e27ba4f91986c4c92f5cb7297f1e01a6d:
>
>   arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP (2026-03-30 
> 09:35:01 -0500)
>
> ----------------------------------------------------------------
> Qualcomm Arm64 DeviceTree updates for v7.1
>
> Introduce the Eliza, Glymur, Mahua, and IPQ5210 Qualcomm SoCs.

I pulled this one as well now. The contents all seem fine to me,
but please try to group the dts changes into smaller branches
so you can send some of it earlier when you know that you
have a large amount of content queued up.

I know this is hard, and I also tend to do things in the
last minute, but it would really help to have e.g. the
newly added SoCs in a separate branch, or even just
the stuff that you know is ready by -rc3.

This pull request alone has 178 files / 258 patches / 38000 lines,
among 686 files / 913 patches / 68376 lines that are queued
up in total across 63 branches we have merged so far for 7.1.

       Arnd
