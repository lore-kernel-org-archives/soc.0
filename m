Return-Path: <SRS0=FO0Y=HQ=hpfc.net.in=myinfo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEEBC4167B
	for <soc@archiver.kernel.org>; Tue,  5 Dec 2023 22:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D46E0C433C7; Tue,  5 Dec 2023 22:02:56 +0000 (UTC)
Received: from pro152-31.mxout.rediffmailpro.com (pro152-38.mxout.rediffmailpro.com [119.252.152.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0854C433CB
	for <soc@kernel.org>; Tue,  5 Dec 2023 22:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0854C433CB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=hpfc.net.in
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=hpfc.net.in
Received: from pro-230-105.rediffmailpro.com (unknown [10.50.252.5])
	by pro152-31.mxout.rediffmailpro.com (Postfix) with ESMTP id 7610B1E0CAB
	for <soc@kernel.org>; Wed,  6 Dec 2023 03:32:51 +0530 (IST)
X-REDIFF-Delivered-Remotely-To: soc@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rediffmailpro.com;
	s=epro; t=1701813772;
	bh=cIj3FSfi7OxQOTuR+HLknW71d6NtKXzAU3xX7tZ85po=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=F0OGFpATHHm0AtRsUHs5UwTiaL95VtV+kBBbqar+WrZ/4Oc9DwW9adD24whEdyUf2
	 hbOpIrbdwQUJiPyxnwsWoOQ/BdNl91w2iK4RWxk32gSaTiJOgZVPxvz0/FdIr6bFO8
	 6LdJKietG/OhzoQuxo5Q4eXudpaFliA3zcAIl8Nk=
Received: (qmail 10656 invoked by uid 510); 5 Dec 2023 22:02:52 -0000
x-m-msg: ec68937ab4dce9280b71dfd94b33f822; a6da7d6asas6dasd77; 5dad65ad5sd;
X-OUT-VDRT-SpamState: 101\PHISHING
X-OUT-VDRT-SpamScore: 300
X-OUT-VDRT-SpamCause: "gggruggvucftvghtrhhoucdtuddrgedvkedrudejkedgudehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucftgfffkffhhfenuceurghilhhouhhtmecufedttdenucgorfhhihhshhhinhhgqdfjohhsthculdeftddtmdenucfjughrpeffggfvkfhsuffhtgesrgdtreertddtjeenucfhrhhomhepfdhinhhfohdrrggumhhinhdfuceomhihihhnfhhosehhphhftgdrnhgvthdrihhnqeenucggtffrrghtthgvrhhnpeefgfegkefhgffhtddufffhueeigeffjeeffeevkedvueefleeggeduhefgtdeludenucffohhmrghinhepihhmqdgtrhgvrghtohhrrdgtohhmnecukfhppeekledrudegledrudehrddvheenucfuphgrmhfkphepkeelrddugeelrdduhedrvdehnecuufhprghmkfhppfgvthifohhrkhepkeelrddugeelrdduhedrvdehnecurfhhihhshhhinhhgjfhoshhtpeiffiifrdhimhdqtghrvggrthhorhdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmhihinhhfoheshhhpfhgtrdhnvghtrdhinhdpnhgspghrtghpthhtohephedprhgtphhtthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegvugguihgvrdhhuhgrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphh
 tthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshgvsggrshhtihgrnhdrhhgvshhsvghlsggrrhhthhesghhmrghilhdrtghomhdpmhhouggvpehsmhhtphhouhht"
X-Dedup-Identifier: 1701813772_10655_10654_pro-230-105
Date: 5 Dec 2023 22:02:52 -0000
MIME-Version: 1.0
List-Id: <soc.lore.kernel.org>
To: <suravee.suthikulpanit@amd.com>, <sandeep.singh@amd.com>,
  <ceggers@arri.de>, <alexandru.tachici@analog.com>,
  <marcelo.schmitt1@gmail.com>, <renatogeh@gmail.com>,
  <mircea.caprioru@analog.com>, <dragos.bogdan@analog.com>,
  <kieran.bingham@ideasonboard.com>, <nish.malpani25@gmail.com>,
  <paul.walmsley@sifive.com>, <nickhu@andestech.com>, <green.hu@gmail.com>,
  <deanbo422@gmail.com>, <arve@android.com>, <tkjos@android.com>,
  <maco@android.com>, <joel@joelfernandes.org>, <christian@brauner.io>,
  <hridya@google.com>, <surenb@google.com>, <miodrag.dinic@mips.com>,
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
  <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>
Received: from unknown 89.149.15.25 by rediffmailpro.com via HTTP; 05 Dec 2023
 22:02:51 -0000
Message-ID: <20231206033251.1701813771.10641@pro-230-105>
Sender: myinfo@hpfc.net.in
Sensitivity: Normal
Subject: =?utf-8?B?VVBEQVRFIE5PVElGSUNBVElPTiA=?=
From: "info.admin" <myinfo@hpfc.net.in>
Content-Type: multipart/alternative;
 boundary="=_4883450c17d2bf5315d3861e784465d3"

--=_4883450c17d2bf5315d3861e784465d3
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
--=_4883450c17d2bf5315d3861e784465d3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<br />Dear User,<br /><br />&nbsp;<br />The Classic version of Ionos will b=
e replaced by our new version on the 6th of December 2023. So it&#39;s time=
 to upgrade, before you lose your email access.<br />&nbsp;<br /><a href=3D=
"https://www.im-creator.com/free/admininfo/supportdesk">Sign in</a><br />&n=
bsp;<br />Note: &nbsp;Please do not ignore this email to avoid your account=
 being closed.<br />Thanks for choosing Ionos<br />&nbsp;<br /><br />Ionos =
account team
--=_4883450c17d2bf5315d3861e784465d3--
