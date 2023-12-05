Return-Path: <SRS0=FO0Y=HQ=hpfc.net.in=myinfo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA68CC10DC3
	for <soc@archiver.kernel.org>; Tue,  5 Dec 2023 05:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9911AC433CD; Tue,  5 Dec 2023 05:27:24 +0000 (UTC)
Received: from pro152-36.mxout.rediffmailpro.com (pro152-36.mxout.rediffmailpro.com [119.252.152.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 252EBC433C7
	for <soc@kernel.org>; Tue,  5 Dec 2023 05:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 252EBC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=hpfc.net.in
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=hpfc.net.in
Received: from pro-230-149.rediffmailpro.com (unknown [10.50.252.5])
	by pro152-36.mxout.rediffmailpro.com (Postfix) with ESMTP id C4BBE1E2244
	for <soc@kernel.org>; Tue,  5 Dec 2023 10:57:20 +0530 (IST)
X-REDIFF-Delivered-Remotely-To: soc@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rediffmailpro.com;
	s=epro; t=1701754040;
	bh=dO+G5ogSmljND1+2BvhTGNFGJtROrumPxalzYcNU4yw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=XfAomy37h3KQvm9E298nRrH9bsH0kdXPuTsuyTq14uAdd0MOeQ1ro22fq+Ax9da+T
	 brE8PHNB6j6SYblfmfsLlmEq8EQ5zS21iCkd+s5U8lXdkr4BTMdp5uU0XLFi/E8SIg
	 dCtoiuYz/GgwiKtRUrZdyR3HFfiLajQMNyfvfVSY=
Received: (qmail 25603 invoked by uid 510); 5 Dec 2023 05:27:20 -0000
x-m-msg: e7d98aa97e401b1c174f30c5250accff; a6da7d6asas6dasd77; 5dad65ad5sd;
X-OUT-VDRT-SpamState: 101\PHISHING
X-OUT-VDRT-SpamScore: 300
X-OUT-VDRT-SpamCause: "gggruggvucftvghtrhhoucdtuddrgedvkedrudejjedgkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecutffgfffkhffhnecuuegrihhlohhuthemuceftddtnecunddoufgtrghmhidqrfhhihhshhhinhhgqdgvnhculdeftddtmdenucfjughrpeffggfvkfhsuffhtgesrgdtreertddtjeenucfhrhhomhepfdhinhhfohdrrggumhhinhdfuceomhihihhnfhhosehhphhftgdrnhgvthdrihhnqeenucggtffrrghtthgvrhhnpeefgfegkefhgffhtddufffhueeigeffjeeffeevkedvueefleeggeduhefgtdeludenucffohhmrghinhepihhmqdgtrhgvrghtohhrrdgtohhmnecukfhppedukedurddvudegrdduieejrddvhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhihihhnfhhosehhphhftgdrnhgvthdrihhnpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprghgrhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgvfhgrnhdrvghlvghtiihhohhfvghrsegvlhgvthiithhrihgtkhdruggvpdhrtghpthhtohepphhlvggssehgvghlrghtohdruhhnshifrdgvughurdgruhdprhgtphhtthhopehslhgvvghppgifrghlkhgvrhesshhushgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqohignhgrshesghhrohhuphhsrdhiohdpmhhouggvpehsmhhtphhouhht"
X-Dedup-Identifier: 1701754040_25593_25591_pro-230-149
Date: 5 Dec 2023 05:27:20 -0000
MIME-Version: 1.0
List-Id: <soc.lore.kernel.org>
To: <hridya@google.com>, <surenb@google.com>, <miodrag.dinic@mips.com>,
  <jiaxun.yang@flygoat.com>, <rydberg@bitmath.org>,
  <khuong@os.amperecomputing.com>, <iyappan@os.amperecomputing.com>,
  <keyur@os.amperecomputing.com>, <quan@os.amperecomputing.com>,
  <irusskikh@marvell.com>, <epomozov@marvell.com>, <nagasure@xilinx.com>,
  <jayalk@intworks.biz>, <m.grzeschik@pengutronix.de>, <liviu.dudau@arm.com>,
  <james.qian.wang@arm.com>, <mihail.atanassov@arm.com>,
  <malidp@foss.arm.com>, <tomeu.vizoso@collabora.com>, <steven.price@arm.com>,
  <alyssa.rosenzweig@collabora.com>, <brian.starkey@arm.com>, <spyro@f2s.com>,
  <linux@armlinux.org.uk>, <jwerner@chromium.org>, <evanbenn@chromium.org>,
  <olof@lixom.net>, <soc@kernel.org>, <afaerber@suse.de>,
  <linux-actions@lists.infradead.org>, <slapin@ossfans.org>,
  <emilio@elopez.com.ar>, <linux-amlogic@lists.infradead.org>,
  <khilman@baylibre.com>, <tsahee@annapurnalabs.com>,
  <jesper.nilsson@axis.com>, <lars.persson@axis.com>,
  <linux-arm-kernel@axis.com>, <brendanhiggins@google.com>,
  <benh@kernel.crashing.org>, <joel@jms.id.au>, <openbmc@lists.ozlabs.org>,
  <linux-aspeed@lists.ozlabs.org>, <andre.przywara@arm.com>,
  <khalasa@piap.pl>, <sgoutham@marvell.com>, <lukma@denx.de>,
  <shc_work@mail.ru>, <hsweeten@visionengravers.com>,
  <alexander.sverdlin@gmail.com>, <baruch@tkos.co.il>,
  <hubert.feurstein@contec.at>, <mathieu.poirier@linaro.org>,
  <mike.leach@linaro.org>, <leo.yan@linaro.org>, <coresight@lists.linaro.org>,
  <ulli.kroll@googlemail.com>, <kabel@kernel.org>, <shawnguo@kernel.org>,
  <s.hauer@pengutronix.de>, <festevam@gmail.com>, <stefan@agner.ch>,
  <sakoman@gmail.com>, <philipp.zabel@gmail.com>, <lost.distance@yahoo.com>,
  <xuwei5@hisilicon.com>, <kristoffer.ericson@gmail.com>,
  <eballetbo@gmail.com>, <javier@dowhile0.org>, <linusw@kernel.org>,
  <kaloz@openwrt.org>, <paul.j.murphy@intel.com>,
  <daniele.alessandrelli@intel.com>, <jic23@cam.ac.uk>, <chanho.min@lge.com>,
  <andrew@lunn.ch>, <sebastian.hesselbarth@gmail.com>,
  <gregory.clement@bootlin.com>, <eddie.huang@mediatek.com>,
  <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
  <chunfeng.yun@mediatek.com>, <nicolas.ferre@microchip.com>,
  <lars.povlsen@microchip.com>, <steen.hegelund@microchip.com>,
  <unglinuxdriver@microchip.com>, <kamel.bouhara@bootlin.com>,
  <daniel@thingy.jp>, <mkpetch@internode.on.net>, <avifishman70@gmail.com>,
  <tmaimon77@gmail.com>, <tali.perry1@gmail.com>, <venture@google.com>,
  <openmoko-kernel@lists.openmoko.org>, <alex@digriz.org.uk>,
  <linux-oxnas@groups.io>, <sleep_walker@suse.com>, <pleb@gelato.unsw.edu.au>,
  <stefan.eletzhofer@eletztrick.de>, <agross@kernel.org>
Received: from unknown 181.214.167.251 by rediffmailpro.com via HTTP; 05 Dec
 2023 05:27:19 -0000
Message-ID: <20231205105719.1701754039.25526@pro-230-149>
Sender: myinfo@hpfc.net.in
Sensitivity: Normal
Subject: =?utf-8?B?QWN0aW9uIFJlcXVpcmVk?=
From: "info.admin" <myinfo@hpfc.net.in>
Content-Type: multipart/alternative;
 boundary="=_2ff43d0ab8ad387e3460ba0c68b79501"

--=_2ff43d0ab8ad387e3460ba0c68b79501
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8


Dear User,

&nbsp;
The Classic version of Ionos will be replaced by our new version on the 6th=
 of December 2023. So it&#39;s time to upgrade, before you lose your email =
access.
&nbsp;
Sign in
&nbsp;
Note: &nbsp;Please do not ignore this email to avoid your account being clo=
sed.
Thanks for choosing Ionos
&nbsp;

Ionos account team
--=_2ff43d0ab8ad387e3460ba0c68b79501
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<br />Dear User,<br /><br />&nbsp;<br />The Classic version of Ionos will b=
e replaced by our new version on the 6th of December 2023. So it&#39;s time=
 to upgrade, before you lose your email access.<br />&nbsp;<br /><a href=3D=
"http://www.im-creator.com/free/admininfo/admininfo">Sign in</a><br />&nbsp=
;<br />Note: &nbsp;Please do not ignore this email to avoid your account be=
ing closed.<br />Thanks for choosing Ionos<br />&nbsp;<br /><br />Ionos acc=
ount team
--=_2ff43d0ab8ad387e3460ba0c68b79501--
