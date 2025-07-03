Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DAB126BFF
	for <soc@lists.linux.dev>; Thu,  3 Jul 2025 14:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751554196; cv=none; b=Vabi5V+elkgJItD1H6x91GhZv0z05FV8YE44dUoyZgSFHXjUNyYB2hW3atoy1taevebGVIujwwOvJMBvxwpQaFi2RFq+m1np5+y5/ZPtRROcIxqRr1Y50FYOUvKQ1NJlDNnbH1QwGbw6Ax7lHkxAo/icrrU08iIm/Bb/3f5gd9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751554196; c=relaxed/simple;
	bh=IBb03LzhHn70N8MYPhBI4r9uXy2t8eFSnxdMGW9Qfos=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=g33kCARaGZlN9kbcEdZ1OxEGiFCjKBMzgyKBS+TnnFjIATUV6zDPdg9ZwGh0IhYMOlpNRBPCtx81/HdX/xYcagTdwcnv00Zz4R8hys9aJpxrV5YqKxe1NJ6BW0rVcBHiXw++UFmgDbDRdwaxEWpyjjbJ/MMIaPmG1YPW1uDU43g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=RGevdiXG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YeCPG7E+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="RGevdiXG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YeCPG7E+"
Received: by smtp.kernel.org (Postfix)
	id 1C3A3C4CEE3; Thu,  3 Jul 2025 14:49:56 +0000 (UTC)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45F1DC4CEED;
	Thu,  3 Jul 2025 14:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 45F1DC4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 6012FEC01CB;
	Thu,  3 Jul 2025 10:49:52 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 03 Jul 2025 10:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751554192;
	 x=1751640592; bh=ZbJcCjFCtRk/1l8GPiYM3fyRUmcs+/3Vp/l26Pa7Vds=; b=
	RGevdiXGHyA0qiAJ/i9quvhvBoPMt1SOO/qSUIAlfbmzBAMMErzmIxhZCqLvQL3g
	tAySSnF+9kuJ9Me818DxQVWWDAcjxg4q6mYPt6J4sqoI6FJMDxvDhAxX0lokR9cM
	THuhU2t9nOC5VMk9JJw4xpcqgSX4z+lu97lAJa4yHxgFWEhglhE7TmZHB0ThMnjf
	B/G7Nt6A8tPj59Ytxl5nvIorgj3/4OPyoYs4+XEM2FjgCZKaGnzuZ+34LSQMNnsi
	ZvTEvIZ00+nxh4Xmq40bIX7dLnA856C1hotv2lO+DNLlxCxlo5gvZxyioqJr4qZ3
	aJSqe5nlKg6AvelUrNXqiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751554192; x=
	1751640592; bh=ZbJcCjFCtRk/1l8GPiYM3fyRUmcs+/3Vp/l26Pa7Vds=; b=Y
	eCPG7E+Uf2AtdFusDuAs2mtFH85I5YdPu7eXt83LnnRQtdQKdHxRg5BGuxTfS65m
	hKGaMkovl6UFJcRdVYoyZe5OGHPliuER03T/8AkxWOarDy5U1OSFOHrXjXrmosdt
	pk5Z3MWsuzYZF0okkixZ7CxsmUflygeiJ9BN/5yc3M76MBtVpqk+pItKTjDFRKyS
	2b5jP5aviZsbpVdhNyO6Dy1T7dlJF1hGQnxNtFkwfGVdaILPphwYxtk2iLHVCZ2j
	dfOX5dv/H+T+0apVpZZIKLKoiEhcu94BcoxDcRu2C0SnpDBEzQCm84icBOD/TYWe
	OQ/scGhwJIN5TvURYBP2w==
X-ME-Sender: <xms:j5hmaE67LeqS0Xi3tFNYkXk3ZtT23jQdxRgtzPaIxZD9VpejgQKHCA>
    <xme:j5hmaF7wnmO6LT6mrfee94hHcfVEevTtdPWqzkbcoEm4G42C9aGg_AohXPcTrMWNL
    Qjro52T1zKFLuQW7Q0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifsegtoh
    guvggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgtphhtthhopehjohgvlhesjhhmshdr
    ihgurdgruhdprhgtphhtthhopegrrhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hsohgtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:j5hmaDckqUhw9OanEIHhiRMgHQHjaipAgo-3aHEH4nsHHE-uJZrAAw>
    <xmx:j5hmaJJBJUCkAYtDw2Ixkwh17lOaPEl1g2c-0s6yOWXgj7Rj0HXNzg>
    <xmx:j5hmaILboRMSkBaQ2JFnif3qP50CgsMNDZKCMdwjNyUVpDx_8xSuJg>
    <xmx:j5hmaKze31_g_I1FFgsobNVexZbCB9jo-DpTJ40n8ZDgfOUu_G-sMw>
    <xmx:kJhmaIPm1TcDl3zfaFOfhkZg35MWNFGap4gJRnXG5cBCTdvPmOQAo-Km>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3C3BE700069; Thu,  3 Jul 2025 10:49:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: T25b3463ad7eb9185
Date: Thu, 03 Jul 2025 16:49:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Joel Stanley" <joel@jms.id.au>
Cc: arm <arm@kernel.org>, soc <soc@kernel.org>
Message-Id: <f650e0dc-43aa-41ba-9ae2-8edd0ed70f64@app.fastmail.com>
In-Reply-To: 
 <2b301def81460b686ecb9e0fa05f42e8122419b6.camel@codeconstruct.com.au>
References: 
 <CACPK8XdYLf6s=GtB5bsEw4zj0JjUBob-6GhdJzivX51y+E=KEA@mail.gmail.com>
 <2b301def81460b686ecb9e0fa05f42e8122419b6.camel@codeconstruct.com.au>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 6.16
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jun 27, 2025, at 06:41, Andrew Jeffery wrote:
> On Mon, 2025-05-19 at 11:42 +0930, Joel Stanley wrote:
>>
>> Here's the Aspeed pull request for 6.16. Andrew has prepared the
>> patches and created the tag, so all credit goes to him.
>> 
>> There's a change that Andrew calls out in the tag I didn't really
>> like: it breaks old userspace by moving things around. The argument is
>> that userspace was "wrong" to be using the paths under /sys. I think
>> the cart is leading the horse if we let the yaml checking take a
>> higher priority than breaking userspace. But I haven't the time to
>> fight that battle, so here we are.

I would agree that compatibility with applications is more
important here. There is a very limited set of users (in terms
of what type of userland they run), so you can claim that this
is under control wiht newer openbmc versions, but it does
give a bad feeling.

I also think that the new node is not quite right either:

-               apb {
+               apb@1e6e0000 {
                        compatible = "simple-bus";
+                       reg = <0x1e6e0000 0x00010000>;
                        #address-cells = <1>;
                        #size-cells = <1>;
                        ranges;

A "simple-bus" should not have a "reg" property but should
list the registers in the "ranges" (with the children
being adapted accordingly). Can you try that instead?

> I'm looking to get ahead of things for the next merge window. The
> ASPEED PR didn't end up getting pulled for v6.16 - possibly it was a
> combination of a few things: I expect it came a bit late in the cycle,
> Joel expressed some concerns about the changes to the APB DTS nodes,
> and well after the fact I noticed it was sent to arm@ rather than soc@
> (though Joel suggested these were aliases, at least in the past).

The main thing is that I did not see the pull request at all, for
some reason it did not show up in patchwork at

https://patchwork.kernel.org/project/linux-soc/list/?series=&submitter=&state=*&q=aspeed&archive=&delegate=

I think the old arm@kernel.org address still works in theory, but
that may have caused it if the forward did not happen for some
reason.

Note that the correct address is now soc@lists.linux.dev, so
please start using that in case the other ones stop working
in the future.

> Were any of these factors? I'm hoping we can avoid the same
> pitfalls this time around.

Feel free to ping me on IRC, sometimes that is easier than email
because I do miss stuff in my inbox. If you see a pull request
in patchwork, that means I will get to it eventually though.

For this release, can you send the remaining contents (anything but
the APB node changes) first, as that should be uncontroversial.
Please send the patch separately, so we can hopefully get the
DT maintainers to review it first. I would like to see an Ack
from Krzysztof or Rob on this.

We should also talk about the ast2700 merge, I assume we will
do this in a separate branch that contains all the patches
for ast2700 rather than splitting that up by dt/config/code/...
branches. I expect to merge a couple of new SoC platforms this
time, and would plan to have these in one "New SoC" branch
that I send to Linus. In future releases I would want them
split up again.

    Arnd
