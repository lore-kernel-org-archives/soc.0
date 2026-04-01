Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0393E30F934
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 22:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081557; cv=none; b=kFcEkqC+cwenrub1jozvEpi5NCAdAf+O2lzYoObqWCYDjal4OVRv3NviQidizg69di4mOBObPe3jy613EAL4dxmJQQ//Z7kHdl3lYnBAo1l+7hKsz7cbvx7A1YQMgDe6XMVP2NI1tWKB9znQfMfEajNEZPn8VD+71eSY1bxvhpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081557; c=relaxed/simple;
	bh=PffMzUmGTFCtfStgH2wHt2NLa9B16b9kVDabEJ1x1Oo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=k52Adjm/Kk3l6Ok3kVRXhjofuieslXkJ3QMJni+AdmsnuHpBx5znF59Nn7L0v/QaW9wCyeGv/f5XtOhlxmTrz9MWijA8oGpfuRVd4emSyCPN/aD5xQ8prIy+U6lplj9ijxyATDHciCNZQIjTc6QB1vw/Rz7ZtGH8QU1rNscWF/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=TXRI9l6F; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nVkDWFzy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="TXRI9l6F";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nVkDWFzy"
Received: by smtp.kernel.org (Postfix)
	id AFF6EC2BC9E; Wed,  1 Apr 2026 22:12:36 +0000 (UTC)
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 90656C4CEF7;
	Wed,  1 Apr 2026 22:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 90656C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 78D2D1D0017D;
	Wed,  1 Apr 2026 18:12:33 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 01 Apr 2026 18:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775081553;
	 x=1775167953; bh=nZflYN8oIWIoiZ0sPdr8St/3bPJquCIUVCKahXdoJnc=; b=
	TXRI9l6FqyEvBkjTCUK2QuMegQFTFxReJCU/rhE1CL68ooKJnGWnZhZ4RTJGz/EL
	5lHLWqV4vfjNFPDlLQ52/EcAMH/zZKtcMRLikuq9GiihyqEJ9UWu5swYo04c6e9q
	jm7ROZZJaeWTps46qlwLFXj2c9t7MWQo6ir7hBzEPaHw/owiY1iYzyWvxQcoPZQn
	Mxy7tc+LlAXdYpzSyCAYJIHs29cMt9/OGEmtiRNCT7pdSt3PrI+xf2VgSv+l6Jpe
	BZhys11jGiSsOVdmX1xu9gOLXMB/qx7CQGvk9ZmWklnvijy8GZQAQ9tWavYiS5du
	J4+0JoBXjvzusIWRx9yJKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775081553; x=
	1775167953; bh=nZflYN8oIWIoiZ0sPdr8St/3bPJquCIUVCKahXdoJnc=; b=n
	VkDWFzyoHMrc6RQTOOH/wMK9KRCnRB6nNHyZJ4ZpSOL+tXbbYgEtveVr5IhHSBW3
	zSXoYMaEYOdR4k/rUxeHjUPlxvmKsMeHjL/IAPdB86YRd92ywYnge99wjGmaSo71
	XP9Q/ER6ijjIgUI0EArjqFymrE6D0GHdrEvF21og2zTEjZ35HWOE6bpOwVy2P9ji
	ZKJmtZ9pQWo7jyTJif3qs0ZVXxjUMBmsPlLgc6yVQ/a8MPK29w+S5i2cUkfuE/xa
	2lHD6WA2Rqf/UyhRaqPhrnYkCexFdSQTs/er+KSItggF2/Vs+E/95Q/PAKSO0+nj
	/hQvTBoI3jeGl9j6cgVPQ==
X-ME-Sender: <xms:UJjNaZSRfWm3a_ZOA_P_VfHlp5jywTCH63Ql_rLa0oJGWIgUq995kQ>
    <xme:UJjNadnHQCNI77JzsWiSvy3gREOKuw8yCh4OOKPOEdmx0zOWHbgPqM94DIgPGQYnG
    Xn49gKbTe2DtHmsGRmQHw8Dl0ubkHnxzmhki-BAq3W8UBsYviIceOI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefhnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehflhhorhhirghnrdhfrg
    hinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepphgrthgthhifohhr
    khdqsghothdolhhinhhugidqshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsh
    hotgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:UJjNadxUiZxIX_xxCUkeV8NqMR8SSCyPnAnrkgjae1MP0fgf5g6lXw>
    <xmx:UZjNaUvBWL1wjd7Cun2OZmIxrXVGBVe3cOWR4mxljFg06csQ5Uo4Hg>
    <xmx:UZjNaUu3FcxDNFbL1BaObfQV1LBWmrgOxkbHVzeOpzRxYiTFC0ZCJg>
    <xmx:UZjNaZPw2lMzQRx_uAILHp75kesfscPtgmW_dpct2O6Lj7j8iLVAkQ>
    <xmx:UZjNaUvXXSdLqDJ-nIsQGv-cCy81Cg6Y-QCXj1BUGM0EpsfhBnO33ADx>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DDF72700065; Wed,  1 Apr 2026 18:12:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AB7J5Jyq4NS3
Date: Thu, 02 Apr 2026 00:12:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: patchwork-bot+linux-soc <patchwork-bot+linux-soc@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>
Cc: soc@kernel.org
Message-Id: <a1141f30-9926-4e5e-9664-47ee9bb616a4@app.fastmail.com>
In-Reply-To: 
 <177508023178.3876275.6579807299020012098.git-patchwork-notify@kernel.org>
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
 <177508023178.3876275.6579807299020012098.git-patchwork-notify@kernel.org>
Subject: Re: [GIT PULL 1/2] Broadcom devicetree changes for 7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 1, 2026, at 23:50, patchwork-bot+linux-soc@kernel.org wrote:
>
> Here is the summary with links:
>   - [GIT,PULL,1/2] Broadcom devicetree changes for 7.1
>     (no matching commit)
>   - [GIT,PULL,2/2] Broadcom devicetree-arm64 changes for 7.1
>     https://git.kernel.org/soc/soc/c/185fb140508b

I'm not sure why pwbot failed to match the commit. I have marked it
as Queued manually in patchwork now. For all I can tell, every
other branch I merged today was correctly marked so by patchwork,
and had the email reply.

      Arnd
