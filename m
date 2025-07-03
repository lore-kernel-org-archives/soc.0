Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D382DE6F1
	for <soc@lists.linux.dev>; Thu,  3 Jul 2025 15:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557588; cv=none; b=D50PwSfdhbqknrE/pEdD+agM252pdN5MNsUYoLFc+41Q6KCLY2eMZUzyOEzw9EOUy+nmazI6DfW8Be7ayH4sYW22wa12U4nckILjPTPi59rMtSxmLQigpLj0s7Yju8tSmHDtA45JHxtjix67t9yHQcpyPoU/P748izKUOaw15zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557588; c=relaxed/simple;
	bh=8qkqz25Z+OY295l7FA5/d+P+bvOmjnSF8n2JjmrH+mU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gQzX3Cg3FASLrI1ZlYhnoxT/F9AdaBhR6+YdDX/qPC3VyPWvbFSIhO+K8kykUQNbq8FgZ3oQb+5CdYbQ+Gcx/30JTjVc42d5gSWYejxXuBuw+U6SI46mB9g2MlYdETuQ/xuWzy3+llzXewRglLQhwvG2An7VDEtEfDlnrjC0j8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=NAPbKmA6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S4b54JnS; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="NAPbKmA6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S4b54JnS"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1541314002CF;
	Thu,  3 Jul 2025 11:46:26 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 03 Jul 2025 11:46:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751557586;
	 x=1751643986; bh=qMpaDrB7UkLu9beIHRtcBdZIh/YQo9DVizq9IGc/uvg=; b=
	NAPbKmA6IAST3ADcVsh8vyOEDiunK5HxhGJ+1LxfWp7eYdvOQBe/MkoiS/QztiBh
	XIRZtmtikNO4Gjw3ANRegnoHbEm8KT+vbj8tKJbKnPhhvn1M8ZReljxoOmeCQgCv
	9YksZM6Kg6P2M1NwNzYarqt3VUAE8Uo+virnNozR0gcre9/AVp/kt08vt7DItE+m
	m66+bOlz2+pOZ1crWLUGnwU20lAQNTBj+cosUNlEZ5qRbrInvz75G04JapyFRqC4
	NSUarw6Sjd5lu4rFqfGJDUx6MZB1fGolVpZp6409hUJqC+EAWwAdpM5JVcRmp05Q
	v4DoJa5a+oGdK3d/jg3T9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751557586; x=
	1751643986; bh=qMpaDrB7UkLu9beIHRtcBdZIh/YQo9DVizq9IGc/uvg=; b=S
	4b54JnS1IOhPxQ9Xb50hzNZLrSaxMHpOaRFml7eZ211TauXw8YTTYGH6MqaKjJqk
	ozvLxkWrQEu3L4bnsrCyRanBaBuMFUBYNuDCWufsU/P1it0+Hg085J1Fm6g6BmSV
	x+P/gFBnTYLttj4BkLAIZs+sccf919V+liKe/yJj52IZpAQ3LxsIvUe9QTSbRijD
	TcTxHMumV+31cgLRIWAqZgneCnbIU+6kQFjw2z7Vo27mJb8VdsJZX9CDwZXz2AB4
	wfKDejqC77Hns0CS7bY5JtJyf516z9ZevArXWZlXx9exqOffMcgMY9m3e+Ndxfaw
	1hW0BER599i4Yz3qj+amA==
X-ME-Sender: <xms:0KVmaL7QXNS_8lHqjk8bHsBAsA5plHc5B8ksCzfWb3qsSqG6SY6rGw>
    <xme:0KVmaA6xLUpu1Tf-HkfgLsJARE2mtozN4w3umu_3Ngdkrg8D9jPUtiZCnsTWgy0Gx
    2A6W7phWf7YUMbXVOY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdeijecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeevgfdvtdekleevueejvedttefgvddvuedvteevffevvdefudeuleffieeujeefffen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhurhhlnhgvgihtthhimhgvrdihohhune
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgu
    segrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopegsvghnjedujeesrghnuggvshhtvggthhdrtghomhdprhgtphhtthho
    pehtihhmiedtleesrghnuggvshhtvggthhdrtghomhdprhgtphhtthhopehprghlmhgvrh
    esuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghl
    vgihrdgvughupdhrtghpthhtoheprghlvgigsehghhhithhirdhfrhdprhgtphhtthhope
    gtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodguthes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegurghnihgvlhdrlhgviigtrghnoheslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:0KVmaCdPz_YrLlOs-prsdvhK5AFXgNLwR2v6tGsSqTGzZ29m96CYXw>
    <xmx:0KVmaMIpOWaGF5ykWGsj5vn4GV0vSZiVdbrnTYzNTnAWDjcjCN2s8g>
    <xmx:0KVmaPLX9tgrHb8uBu3UU-wqTdwLUd9-MUINI0laiHCuoZT04lcz9A>
    <xmx:0KVmaFz6G5dTPChnP8_ZLkrIzdlFXXvYq3luODQm-iAy2R7oHJgsig>
    <xmx:0qVmaNQ6p9dyIdT6i0tklQuQMCX-buRIBfiMItxgCkmH7MLfSet1dNF3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 87800700065; Thu,  3 Jul 2025 11:46:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Tfe83a0ac9677fee7
Date: Thu, 03 Jul 2025 17:46:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ben Zong-You Xie" <ben717@andestech.com>, soc@lists.linux.dev
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Rob Herring" <robh@kernel.org>,
 krzk+dt@kernel.org, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Samuel Holland" <samuel.holland@sifive.com>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>, tim609@andestech.com
Message-Id: <41730539-95e8-45f8-ba3e-7a2c72fc1fe5@app.fastmail.com>
In-Reply-To: <aEr69QIikSuD+iCf@atctrx.andestech.com>
References: <aEr69QIikSuD+iCf@atctrx.andestech.com>
Subject: Re: [GIT PULL] Andes Voyager board patches for v6.17
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jun 12, 2025, at 18:06, Ben Zong-You Xie wrote:
> The following changes since commit 0bb71d301869446810a0b13d3da290bd455d7c78:
>
>   Add linux-next specific files for 20250612 (2025-06-12 14:07:02 +1000)
>
>
> ----------------------------------------------------------------
> Andes Voyager board patches for v6.17
>
> The patchset [1] for the Andes Voyager board (including the Andes QiLai SoC)
> has been tested on the latest linux-next/master branch and reviewed on the
> relevant mailing lists.
>
> [1] https://lore.kernel.org/all/20250602060747.689824-1-ben717@andestech.com/

Hi Ben,

Thanks for your submission. I see that Conor has been guiding you
so far, but there are still a number of small mistakes here, so
I won't pull this version.

I'll reply here in more detail than normal, so you can get things
right for the next submission:

1. Your branch is based on linux-next, which means it cannot be
   merged cleanly into mainline because of the thousands of other
   patches that are now on your branch. I recommend to always
   use -rc1 as the base for new work.
2. If you have a git tree with your work, it makes sense to have
   that in linux-next directly, but that can probably wait until
   after the initial merge so your name shows up in the
   MAINTAINERS file. Once that is there, you can email
   Stephen Rothwell and ask him to add your git URL
3. The github.com URL is not one I can pull from, please use
   an https:// URL next time. You can configure separate 'url'
   and 'pushurl' settings in your .git/config in order to
   have 'git request-pull' get the right one
4. Once you are in the maintainers file, you can ask for a
   kernel.org account and publish your branch there, this
   is usually preferred over github.
5. I see that you have signed the commit with your gpg key,
   which is good, but I have not been able to download
   this key from any known keyserver. Can please upload it
   somewhere and let me know so I can fetch it. Is the key
   already signed by someone on the kernel keyring?
6. The email text in the pull request has overly long lines,
   as 'git request-pull' tries to use the entire width of
   your terminal window. The easiest way to avoid this is to
   redirect the git command into a file, to get the default
   80 character line length. I personally use
   'git request-pull ... | xclip' to put it into the
   clipboard.

To make things easier, maybe just send the contents of
the pull request as patches to soc@lists.linux.dev this
time, then you don't have to figure it all out at once.

     Arnd
