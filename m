Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F05314A7A
	for <soc@lists.linux.dev>; Wed,  4 Feb 2026 12:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770207463; cv=none; b=J+w3L+kYgbrQFpISrBzRHvrptbKlqajBwaBGxFLeRf90Q8LW5BqTExcdoA2s8CwRtPyeziB72j2jEQ0KY43qfd5K7Q5CCU9+feV2nmIVAHHbKcZCc1R2vd5xVN56wsXxgub2kBPUui+fSPTojUcFFdy9BecYqV7COywfVUVB+O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770207463; c=relaxed/simple;
	bh=5OoMKMrI/6zkj6rv+EJxEa3oo9cMuvE2CgdjUfT6wDo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=ov3VhRyFVzFJQfKy5YhuHPIPyzncHbBkXoF+3Om1inGJMzCvjqow3e3fIXZIvT7PDN2YG6KYakWY3j4bLFFxsMGMkt3scqfszWB1Xhh9pjVCqcOHCCSH0jCFz0RWiZHJmrSSguYcT1vpDZ6aLGkLOFdS+/AEMLHtAc70iO477eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Zjomvf1e; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YcrYDk/m; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Zjomvf1e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YcrYDk/m"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 427EA1400089;
	Wed,  4 Feb 2026 07:17:42 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 04 Feb 2026 07:17:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1770207462; x=1770293862; bh=oB
	VsKp7U+To9N/uLjz9BWdVSLM9ncuG1DF9uDyqjbjA=; b=Zjomvf1efYgmIx6748
	twyeSHyAMG/hka4an+NAE5EjqWC2ebucn+OYRKMVEkFJOs3XOe1+HtbhV64n4dl9
	AKdzZ9zmFDS9YKb8qIzGl7jZHBRz+uT65B0Zb1JBfLSpDPbmgEABFqtiFeWEuU4S
	7b/EKO7FcrEJkqTJJd6PnR3lpZiqYPCYdiCMus5aTKlF9GYmMAi9VHzp+jSg/Ecg
	80nTCgVhis9OVzcFAVyZ8f/9/CKk5mdekvKMWR5ZX2rs0QV4POFgav6JcBeiB8RP
	+fZcBfNpqHLADsoJb0PbaejZ8fmuMnu8eqEhYDq1BWgmAsaZ85D0Bj1QvNf1TNAu
	v2gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1770207462; x=1770293862; bh=oBVsKp7U+To9N/uLjz9BWdVSLM9n
	cuG1DF9uDyqjbjA=; b=YcrYDk/mYDc0sUaAPrMWZtQsGC/WXIso7WBc6ICN37Ev
	5yKMEVF1NjEAgzk3JsRQZtNvGk4I7bLdRFLFhv2797XARzXB8JUeWkghMkEvIO4D
	s0s8lnGK/x0s113Rcss9y7+c7ue9lzZOyKFt+zuARKD89BquNE00Y7WoULdwCchd
	U0ULXz0QZAHLnW4ciXWLuZgouobQLK3DnGBv6srna57Dy2NthDT1eoTkVzJqZCAb
	8Ndoq4/CxC8K6sZG7u+JL3Dt5tHms6mnIDvUbJ+V7t1Ie3T/xFHd8B50mZf6UoEd
	nMYu3CTf1ZJR+PjWOOAajTicw3HVwWGihnxKC0+Svg==
X-ME-Sender: <xms:5TiDaawrKWGWxy6UyTxaV1wWyKjj532hx1SEyb1oTqZHKOBcnZY6uw>
    <xme:5TiDaRH04qG1Rvx8DMDZ1DwnIQldMQOQbkJNtWnd-R9qVBTyj7qgVAd044BSJkEr3
    8jgCeLZKKRtT_ogpnhZIgNRPzbixE249nPVfhdQSHos52Jhub9or6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedvgedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkffutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epudelieegkeevueegtedtjedttdelgeehhfdvhfeuheethfduleffuddvueelveetnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehshhgrfihnghhuoheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhu
    nhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlh
    eslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:5TiDaRj3GH1E0G75nRhrVe-Q3Yu3q8fVaTFbgfEdPkolSBKuSiod4A>
    <xmx:5TiDaecfhJSvppvzrPfGnJxk4i3jm_I_yuBQKpTBQCzfMiPli7TOYg>
    <xmx:5TiDaRiPzI_lJ-6vrC4T2d1al2BKBu6uH0xTKrKI8JmjrfS6ClSApw>
    <xmx:5TiDaWxMPiMKNzbQr0qXyu8j5qELepCU32ASBWfTcotJj48JyNWJAA>
    <xmx:5jiDaXnK2kzcuhQ5oLDbvPEQ_O8di4IDSsWsi2vszp_8cYLR5Jue2Ozq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 95ACE700069; Wed,  4 Feb 2026 07:17:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 04 Feb 2026 13:17:21 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: "Shawn Guo" <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Message-Id: <d9748b0a-1b06-4d7e-93b0-3ceb96784fc1@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.19, part 3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit 63804fed149a6750ffd28610c5c1c98cce6bd377:

  Linux 6.19-rc7 (2026-01-25 14:11:24 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.19-3

for you to fetch changes up to c3cb2722e28969650c58d6defb09d57339a2a223:

  Merge tag 'qcom-drivers-fixes-for-6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes (2026-01-29 10:02:11 +0100)

----------------------------------------------------------------
soc: fixes for 6.19, part 3

Shawn Guo is moving on from maintaining the NXP i.MX platform and hands
over to Frank Li. Shawn has maintained the platform for 15 years after
initially upstreaming support for i.MX6 and i.MX23/28, and his work has
helped make this the most important industrial embedded Linux platform.
Roughly one out of five devicetree files in mainline kernels are for
the wider i.MX platform.  Many thanks to Shawn for the taking care of
the platform all these years!

There are also two additional updates for the MAINTAINERS file, and
a fix for error handling in the qualcomm smem driver.

----------------------------------------------------------------
Arnd Bergmann (2):
      Merge tag 'imx-maintainers-6.20' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes
      Merge tag 'qcom-drivers-fixes-for-6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes

Christian Marangi (1):
      soc: qcom: smem: fix qcom_smem_is_available and check if __smem is valid

Shawn Guo (1):
      MAINTAINERS: Replace Shawn with Frank as i.MX platform maintainer

Sudeep Holla (1):
      MAINTAINERS: Change Sudeep Holla's email address

Yushan Wang (1):
      MAINTAINERS: Add myself as maintainer of hisi_soc_hha

 .mailmap                |  3 ++-
 MAINTAINERS             | 41 +++++++++++++++++++++++------------------
 drivers/soc/qcom/smem.c |  5 +++--
 3 files changed, 28 insertions(+), 21 deletions(-)
