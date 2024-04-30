Return-Path: <SRS0=GLt5=MD=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82632C4345F
	for <soc@archiver.kernel.org>; Tue, 30 Apr 2024 06:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4927AC4AF17; Tue, 30 Apr 2024 06:40:57 +0000 (UTC)
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD8CCC2BBFC;
	Tue, 30 Apr 2024 06:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD8CCC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id BECC31380415;
	Tue, 30 Apr 2024 02:40:54 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 30 Apr 2024 02:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1714459254; x=1714545654; bh=UTgY8DspdC
	k02r/eJDOuN3XaUdRddpWzX59neODEuwo=; b=STDPKYdRjPLoKfQe02dw/kV4/E
	NNRJ9YQhmxt0ID0EY3PcOSK9osq8cp8TgbFKwqkrhhpiR5OOFxodX1SrjCqkVK+N
	/I31729nShKAzxj2Lq2Oal50jnDQEDWDSQ9BGGxCuOzwkOSJqhITq1ziFRkTzq3Z
	i9MIhtZgG75yO5cKoMS+x3G+/rSOjuTkZxpcDSOEl7D9IZ7SFemRM+li2r6kOsUN
	8BaSFQUN6fAXVoFb4oX1d+/soPbj4nMruX0TqUizbuGzft3+LsOJldorZwczxCRB
	x+yDEfblXXNEWqF8vL02geSbSrbA4bqF6jKtQ3NdyYOBtlewC/H5o3mXjuoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714459254; x=1714545654; bh=UTgY8DspdCk02r/eJDOuN3XaUdRd
	dpWzX59neODEuwo=; b=O4fKpnH7Kkfyx25MQrloyM/99rvjv7Di5oCk24CjIWCg
	VpDklgd123sQUU/M7LkIfSiGczTnuJwRy0UdZjDOsRAZSq/HKfxq8wmAzacxvJ8X
	/75FtKU2bN9cOi2+e0GyV7taArrKbQldCjbdmmICI0MKQSFFwLHdeUftskxUD+3U
	aJGjgJZgN5BXjjKgjP0P1HDtbJCkVytpYz1WqcxHE66ITtFjFwtWCn3Uh1MQAxvv
	tiHvxH+mJC0wmD1n8WlkPTlOJkIVu9rgi1I+DO1W+KbBQXKbVrKT+HCWDkNa/5JF
	AGKV/grjkhp8/eZf6S27G3JnCaaCMA+v8RFKEFS4dQ==
X-ME-Sender: <xms:dpIwZrwRIPH0E9G-Z1afueN-q8tTDC0CTuIqb6ZhT8EQOyOVbn-srA>
    <xme:dpIwZjSR3CNfNHXoLItSzsXe5Wguy5Z5EbldhUV3yOAH0cftuzR9hwQd3IlMf77D4
    xzdV0zILDKhYSxOybI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdduvddguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:dpIwZlXjrlpPZS1wRYuFr9vGtRrJlJzU-cUyhHkfpajmmDvKCOQJNA>
    <xmx:dpIwZliV9ElfWpyYJGBVLV4RWnmNgR6O8JKSNMDYzo2j6bZG5g9nXw>
    <xmx:dpIwZtBqtHQlzCPUtKGq61RLpHRpEp6fMW7uZCGEScXapjPKvJC2Rg>
    <xmx:dpIwZuL2biEtdOEwt5yEEVYn_Iti5EjJRXtSorpWTUv9fN117g9RFQ>
    <xmx:dpIwZo8CyZ7CEI75cKXVE-b26aWVOU-HjR23eeVQOGyTOC8n0BxyX7AN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7B5E8B6008D; Tue, 30 Apr 2024 02:40:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
MIME-Version: 1.0
Message-Id: <dc4975fa-82ae-4b2b-94f2-c518595f8694@app.fastmail.com>
In-Reply-To: 
 <20240423102915.371782-1-angelogioacchino.delregno@collabora.com>
References: <20240423102915.371782-1-angelogioacchino.delregno@collabora.com>
Date: Tue, 30 Apr 2024 08:40:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 arm <arm@kernel.org>, soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 Device Tree fixes for v6.9
Content-Type: text/plain

On Tue, Apr 23, 2024, at 12:28, AngeloGioacchino Del Regno wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
>
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>
> are available in the Git repository at:
>
>   
> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ 
> tags/mtk-dts64-fixes-for-v6.9

Just FYI, these were both merged into v6.9-rc6, but you got
no automated notification because I had to merge them manually
into the arm/fixes branch.

The problem here was the ssh://git@gitolite.k.o/ address, which
does not get picked up by the automated tooling, and I see your
later pull requests have the correct https:// address instead.

     Arnd
