Return-Path: <SRS0=5qeS=QA=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987ACCD13CF
	for <soc@archiver.kernel.org>; Mon,  2 Sep 2024 10:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5EDC3C4CEC6; Mon,  2 Sep 2024 10:16:11 +0000 (UTC)
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99846C4CEC2
	for <soc@kernel.org>; Mon,  2 Sep 2024 10:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 99846C4CEC2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id C92021380366;
	Mon,  2 Sep 2024 06:16:08 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 02 Sep 2024 06:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725272168;
	 x=1725358568; bh=3RNolP0Fo/GSx4B9IVA751JpgSB5qu66Jzzq2ZzhW5o=; b=
	eswqT4+kmM9y1ZYn3In9gFzhOS2csprktMPRjMHRe/gaK25CIc6SgXNQXTjo8Wa6
	jXmC2wkMn5BtLXhHHt+6xNogKhOvkO6AUAAQsOiZ5nssDIiVYzdakHa1x3rAXl22
	bA6DTspqAz53Dbl3SKNjf3fhn11sxjtMBBF8qwOgJSlx6gwpf3l/00PfOudUyJOD
	N62jErUHi3spuhKABZyv4uKFCZBOYePT+vLDideOnSkYH+nNZOzQf8QERsYm6/6z
	YF7vX2u6krQg9HJA5XgZqsVLNWLBbghGXpmwlSBbjEplONaJyCuC2nYppHf3OXi4
	lAANex0FtnYzPfx47tLLYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725272168; x=
	1725358568; bh=3RNolP0Fo/GSx4B9IVA751JpgSB5qu66Jzzq2ZzhW5o=; b=e
	+ExLf/fMAWshxJVvPU1X5yEAdOHmK9hNB/yqQ8kxmmyTLD9dpvXsUA9mt0wMpRBR
	B4QmKgK8Egjn6RxhnaL9URjmo66lCeEnwLLsEHmsPXIR9lQkQZswPrb+GbLyEjuF
	T/AfVyywjsTrFM2lQfzFag0I4DWVjbAmEBviZeeD/1S4bL4HjqWmvpSvxnTg2JuF
	EdUYQvyhYVV3hAgINmXuKz44cQ4sIJoRa6lzwNVOaFk/fDzVtQypNHdmKQYbYivV
	cvdU2uxnoM5IrJAEqai7L6UtWdV2Ib/lph2qViDl4WnAp22ysWUbQYIqXRWkJMd5
	rPYDYkIKoWfAPwGkXPK5w==
X-ME-Sender: <xms:aJDVZm5k9mjxtlOIpXK9ChinEhWo609Ro2nvgiHoILV06Mjeyy7MiQ>
    <xme:aJDVZv6ygVCfotEnPBexS1EfrO2vKvnkwttQLJ1F-hEwbxrbra3n1coDUtGzwHpAa
    p2_qaojohSkRvOwirg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehfedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepudeffeetfeekveffkeeuheffteevuefhvdeuteeg
    udfghefhffehffejhfdugeeinecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrh
    hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepjedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhn
    rdgtohhmpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouh
    hprdgvuhdprhgtphhtthhopehsohgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegs
    rgholhhurdhluheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuh
    igqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgt
    phhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpd
    hrtghpthhtohepgihirgholhgvihdrfigrnhhgseifihhnughrihhvvghrrdgtohhm
X-ME-Proxy: <xmx:aJDVZlfCkQv5YD1df9WF3UxV8-73LSebwlij2g30dyCjtygfi9GwJw>
    <xmx:aJDVZjJVwcDSlCvpIjUMNajK4iw7UrvwyBsL1SfT0JoBDGE-8E5TBg>
    <xmx:aJDVZqL2N-eo5zr8upQI_c6H1_jYkgDdHfM34Vxk1I5Srhf9VL9Kxw>
    <xmx:aJDVZkwrqBQecRS2uMx6CwFSTma0df7hJs2WjIA-zQ6hHauyqYgw7g>
    <xmx:aJDVZrr41cGF5Hg3e63WAQOgDseqUDR6ogJbcjhun26z1kfb7FSYBlGZ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 471F92220087; Mon,  2 Sep 2024 06:16:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 02 Sep 2024 10:15:34 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Cc: "Herve Codina" <herve.codina@bootlin.com>,
 "Xiaolei Wang" <xiaolei.wang@windriver.com>,
 "Baolu Lu" <baolu.lu@linux.intel.com>
Message-Id: <cc725b99-12f3-4476-948c-8b00af563dfd@app.fastmail.com>
In-Reply-To: <dfafbd92-1e61-4e80-aa5c-2bfbe1defbeb@csgroup.eu>
References: <dfafbd92-1e61-4e80-aa5c-2bfbe1defbeb@csgroup.eu>
Subject: Re: [GIT PULL] SOC FSL for 6.12
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024, at 13:44, Christophe Leroy wrote:
> Hi Arnd,
>
> Please pull the following Freescale Soc Drivers changes for 6.12:
> - A series from Herv=C3=A9 Codina that bring support for the newer ver=
sion of=20
> QMC (QUICC Multi-channel Controller) and TSA (Time Slots Assigner) fou=
nd=20
> on MPC 83xx micro-controllers.
> - Misc changes for qbman freescale drivers
>
> There are no conflicts with latest linux-next tree.

Hi Christophe,

I've tried pulling this but ran into a few issues here, none of which
are related to the actual patches in your branch that look totally
fine to me:

> The following changes since commit 5be63fc19fcaa4c236b307420483578a569=
86a37:
>
>    Linux 6.11-rc5 (2024-08-25 19:07:11 +1200)
>
> are available in the Git repository at:
>
>    https://github.com/chleroy/linux.git tags/soc_fsl-6.12-1
>
> for you to fetch changes up to 1fe683bf6113da3cb694bc18ae655b2ee10ba39=
3:
>
>    Merge branch 'support-for-quicc-engine-tsa-and-qmc' (2024-08-25=20
> 20:48:47 +0200)

- There is no tag description in here, which would give me an empty
  changelog text for the merge commit, or force me to summarize your
  contents myself. Please describe the contents of your branch in a coup=
le
  of short paragraphs, in a way that helps me and future readers of
  the changelog understand what kind of work is being done. Don't
  repeat the oneline commit messages of the individual patches though,
  as they show up right under your summary anyway.

- You have not signed the tag, so there is no way for me to verify that
  you are actually the person that uploaded the branch. Ideally this
  should be signed with a gpg key that is on the kernel keyring, but
  even a brand new key is better than nothing because that way I can
  at least check that your next pull requests are signed by the same
  account as this one. Since you use a github.com account, this is
  even more important, as I can't easily see if you are the only person
  that is able to push to the github user 'chleroy'.
  Using a git tree on either git.kernel.org or your own domain would
  be ideal here, but github works if that is all you can easily do.

- My branch is based on 6.11-rc4, while your tag is on top of 6.11-rc5,
  so pulling it into my tree would require a backmerge that I try to
  avoid (it shows up when Linus pulls from me). Please rebase on
  an earlier -rc, ideally 6.11-rc1 unless you have a reason to need
  something later.

- Please add the linux-arm-kernel and powerpc mailing lists to cc
  for the pull request, so the PR gets properly archived. I saw this
  was missing because I could not apply it using

    b4 pr dfafbd92-1e61-4e80-aa5c-2bfbe1defbeb@csgroup.eu

  This command failed as none of the mailing list archives have
  your message ID.

Please resend with all of the above changed.

       Arnd
