Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598D078F5D
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736951248; cv=none; b=h5NF+7gcECzHRvjEa41zAzGR+gGQqmMmYWvvHtV59L+cUxeZd1Bt2LIj+k876Q8X6G+UQq4CT9T2CDkzJDdZjICHOTGFkz7DoimUhF7nDwO8zR16Ol4rES6b4TVfQaIdmno4ep+RBc5/Hloq4vANJRUthuYyDFgNV8pYziMLKLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736951248; c=relaxed/simple;
	bh=5cmJI8dDQZgwYUCjSDe+MbTfU7ztOqX5Aup1UmdV9sU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HncDqCmNVuVIPQlGNXGJLKgJzLt2f7PVParuI9itD7/YIz1YCTOtnw0tFE7WEOggs9g9gmKCXHiKtezmqvDbiunKwgfn3a54kJOjS9vRHaHjI1Jk8PGTwLXP9EXVn0mbzM6brdxgp4FgJhnazHsGdDavkttxraAKAZX809ff2Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=zlnzjJHI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jXck41nM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="zlnzjJHI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jXck41nM"
Received: by smtp.kernel.org (Postfix)
	id D4F4CC4CEDF; Wed, 15 Jan 2025 14:27:25 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D4AAC4CED1
	for <soc@kernel.org>; Wed, 15 Jan 2025 14:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9D4AAC4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4A89F2540118;
	Wed, 15 Jan 2025 09:27:22 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 15 Jan 2025 09:27:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1736951242;
	 x=1737037642; bh=nSkTlQ8+HyMT54GNGl3HP3EHqUEYjgJY5ZhUbjRzHHU=; b=
	zlnzjJHIxVfp6s2sqT/UywizFqgrKhyAjOFp6qTCBBmLHUjMNeq/cIwoFO+Vtm/u
	J4isKtGaxHDo09CkHkfKEuDBwLh2U7OHvw9RiJXwcEKmNmdiAefUdF82n+FjAFv9
	hyT89kL2kPRZDGae5Iu6/592Y9s9f8rOmp6VYwRcsCs5JajS6+Ku6bgAitD+/MCA
	XU56BVxZEhg8u9VR6WlOYg3TQXOmlHDdnZFSiCCfcfLqqdRdV5u/CdWEmHRZi3yc
	dBJTEC1/noemIFQfYtGdsioSx5ax4hV2dnG2JoQlXCFyPZoHc8IeLF7Kf2Brgxzw
	hu9drCEWrNIVszbTn9OzaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736951242; x=
	1737037642; bh=nSkTlQ8+HyMT54GNGl3HP3EHqUEYjgJY5ZhUbjRzHHU=; b=j
	Xck41nMYvSQ9QDCbqJ0OWePtloei4kU9USBByEJr80VvYaoJCZCdnvk5eP4/lNNg
	m81zOu0MI0fMwW6D7yNL2hXfWNFWYjkLM5SMd6DDcX44XKl1K6wyJ7fCnrgDNOH4
	Wo9aVTOF+Ms2ph87t900R1XjrawMqNdhpqJX2qzsYEMQ5l8vBiQ8Aaqv71mr+lqC
	UPcqXeWltfpIMWSZn1wNloKGPfbmx73J6thSSv6cdjG+7r7DzPPWr7TckqoEdmZq
	HkaBeIUlHWfQeK5euxSmXzowusUqjOr5KAiRzq4JGmB1MxnF9GcF/ZgxG7XH2blL
	uvkgL4Qr4B4ZNHq2t7WEQ==
X-ME-Sender: <xms:ycWHZ8xYxRrPKE-21Jclq-Okd81qooSkPQ5I975N5I-5Da3QUVI2Kg>
    <xme:ycWHZwQz1L-ZQBjchCH-Vr8Q0rOKTxJ44-lZ_xyBuOTY5O72-hYsadbLJX54V8s-u
    g9t-5Y1XGjAp0EVZBo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehledgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeek
    keelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghr
    nhgusgdruggvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehkghhughgrlhgrsegrnhhtmhhitghrohdrtghomhdprhgtphhtthhopehmhhho
    lhgvnhhkohesrghnthhmihgtrhhordgtohhmpdhrtghpthhtohepghhsohhmlhhosehgmh
    grihhlrdgtohhmpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtghpthht
    ohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghfugesthhirdgtohhmpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ycWHZ-WoP8q8z7_3MxFWOfrDrTIenyNwV4RjKImJE23lQ30DrNvoTg>
    <xmx:ycWHZ6gT2Nz7jrNealhtvrcDYey9C4S2G6VmKDgmDiicGwCQRCai9A>
    <xmx:ycWHZ-ASzTSCcy1Myfflwf_w9pKXO-wnc4BSBchZG1pZo7fbRMDHsw>
    <xmx:ycWHZ7LlrOFQc74LnQJsSRWLxDiPelP8bCon46n9Wgb9tCilLszYGA>
    <xmx:ysWHZw2Jqr7sL--8gzraEiv0ilT1m35AoT1YvcHwLf2YNUJEeWn6CEGR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4B38C2220072; Wed, 15 Jan 2025 09:27:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 15 Jan 2025 15:27:00 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Gabriel L. Somlo" <gsomlo@gmail.com>, soc@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 "Karol Gugala" <kgugala@antmicro.com>,
 "Mateusz Holenko" <mholenko@antmicro.com>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Davis" <afd@ti.com>
Message-Id: <abcd6ce1-546a-4d49-abac-0f9b22b38ead@app.fastmail.com>
In-Reply-To: <Z3bHsU4mJYM0xheO@glsmbp.wifi.local.cmu.edu>
References: <Z3bHsU4mJYM0xheO@glsmbp.wifi.local.cmu.edu>
Subject: Re: [GIT PULL] litex changes for 2025-01-01
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jan 2, 2025, at 18:06, Gabriel L. Somlo wrote:
> Hi Arnd,
>
> Thanks for applying LiteX specific patches through `soc` in the past!
> There's one patch from 2024 that seems to have fallen through the
> cracks, and part of my 2025 new year's resolution is to figure out
> how to properly act as LiteX maintainer and send proper pull requests
> up the chain, so please excuse any mistakes in the PR below :)

Hi Gabriel,

The pull request looks mostly fine, but I'd like you to resend this
one in order to improve it a little more:

- You have based on commit 56e6a3499e14 ("Merge tag 'trace-v6.13-rc5'
  of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace"),
  which is not an -rc release. Please rebase this on 6.13-rc1
  instead (the earliest -rc release for the current merge cycle
  that works as a base) in order to get a better git history

- in the subject line, drop the date and instead add the kernel
  release you want this to be merged into. In particular the
  information I want is whether the contents are meant as bugfixes
  for the current release (and possible backports) or as
  improvements that are only needed in a future release.

> ----------------------------------------------------------------
> litex patch(es) left over from 2024
>
> This is the one remaining for-upstream LiteX update from 2024 that
> has been reviewed and successfully tested against the latest Linus
> tree:
> 	- drivers/soc/litex: Use devm_register_restart_handler()

The tag description ends up in the commit log above a list
of the commits in it, so don't repeat that list here. A summary
of the branch contents is always welcome, especially if it
contains some background details, but it should not
duplicate the things that are easy to see otherwise.

      Arnd
