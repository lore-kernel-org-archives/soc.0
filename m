Return-Path: <SRS0=H0lP=6C=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F004C61DA4
	for <soc@archiver.kernel.org>; Mon,  6 Feb 2023 10:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48165C4339C; Mon,  6 Feb 2023 10:41:08 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C74AC433D2;
	Mon,  6 Feb 2023 10:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8C74AC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id A83F25C00BB;
	Mon,  6 Feb 2023 05:41:03 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 06 Feb 2023 05:41:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1675680063; x=1675766463; bh=uCoi35/qpA
	Gbg4K610ThQiFSV+EgLKSj3kzuykIREAg=; b=fDdNXCg0YFncH8C7jw3vokRaYz
	WL8foqKncBFWPz9WYDKA/Fwitxfi4obvpw5bfkDbriJjOzCvmVYIeNgc5+apHreD
	6YRhNCAltoMe1W5JGh3MFF+VrlTboPAVNd/7S8ST96gbV/NBip6V/PlGUXwfBN56
	fs28rMDI+ZMGGu6HybN7sP41WayGVbPvpaBlrzUS6rYSpFtMxSvPNdArNAoNWEeX
	10Kcw8PrxKS6S+LgAVpbK3kCxpIB7Z/yXSP5S+SvbFSSjvEtAu5D19t1+ikj3QdH
	jdriS0PI4h4F04fTyBF5WNyU4TlJP18doogTW4YLEMVjfBG6TM/4HAflYZFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675680063; x=1675766463; bh=uCoi35/qpAGbg4K610ThQiFSV+Eg
	LKSj3kzuykIREAg=; b=XcujpoGYeR5jVMqdfz15z99Uvy65LGukjS6Gq4T3pIYp
	AU98H8FwY2bYK3EyCqhAAOU0jSw5t/FqatIKnIMEYE4GxENyHA2xavneFA22ecY9
	s4Is7oI6jI8ID/kuyEsKbKPBBrQdKuTzlhbmqJm0B65uNwztKU2h22wnfWsUKN8w
	w1sPBLFiu4JXN978kvqC3+zZciwkP70PwV0B/ihJCYUnFaVTerfto9DCiMr0v/eg
	byVHnVhZqbRqFybBG4N4hIN7QSRnv/CN/tPTGTw5xLkT5iChP5UbxRzUTu/rZ9AP
	sPyvjbQIabTrgPxJlA5Qw8Rot8BBQljwYxu+NMmFTA==
X-ME-Sender: <xms:P9ngY_993sGs46_Vi5Ac4qW6H86gjZptEZB-TR_IIl8BZyU1aF7nsg>
    <xme:P9ngY7vb-AGaeaFiM9k_wRN_afi7V-Wb68lP6OTZyj_XOd6M8BvrSFV7BL14tlW_i
    k9XMnAJE4jJ-L9J3oo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegiedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:P9ngY9DoIx6PO5eTc9M0l-SZ9V_rMD9YJqBVqQM4m1MB1PyT-VID6w>
    <xmx:P9ngY7dsGF0irRr-sinMiaveZUG5b7Ip-vloVQ-6C4viFzjd4UQoBg>
    <xmx:P9ngY0N4CryAROgciw85Bu7kl_O-GkkA55ifJ6WFxkBzo9-sEjDDGQ>
    <xmx:P9ngY5qKdoIxwEhwNvvrZNk6d5ErQvQjx1NJ2yEKcu6i-k1H6yHN6g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3FFF6B60086; Mon,  6 Feb 2023 05:41:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-108-ge995779fee-fm-20230203.001-ge995779f
Mime-Version: 1.0
Message-Id: <6f7f9e4b-f48f-44b2-af15-6b2bd80b12cf@app.fastmail.com>
In-Reply-To: <8e05c729-89bc-20f3-acf6-096fb85d7e36@foss.st.com>
References: <8e05c729-89bc-20f3-acf6-096fb85d7e36@foss.st.com>
Date: Mon, 06 Feb 2023 11:40:44 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Kevin Hilman" <khilman@baylibre.com>, "Olof Johansson" <olof@lixom.net>,
 soc@kernel.org, arm <arm@kernel.org>
Cc: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Subject: Re: [GIT PULL] STi DT changes for v6.3 #1
Content-Type: text/plain

On Fri, Feb 3, 2023, at 14:52, Patrice CHOTARD wrote:
>
> The following changes since commit 6d796c50f84ca79f1722bb131799e5a5710c4700:
>
>   Linux 6.2-rc6 (2023-01-29 13:59:43 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/pchotard/sti.git 
> tags/sti-dt-for-6.3-round1
>
> for you to fetch changes up to 4722dd4029c63f10414ffd8d3ffdd6c748391cd7:
>
>   ARM: dts: stihxxx-b2120: fix polarity of reset line of tsin0 port 
> (2023-02-03 14:41:50 +0100)
>
> ----------------------------------------------------------------
> Fix polarity of reset line of tsin0 port for stihxxx-b2120
>
> ----------------------------------------------------------------
> Dmitry Torokhov (1):
>       ARM: dts: stihxxx-b2120: fix polarity of reset line of tsin0 port

You've based the branch on top of -rc6, which would force me to
backmerge the mainline rc into the arm/dt branch. I would
much prefer not do that unless there is a very important reason.

On the other hand, this does look like a bugfix that could be
applied for linux-6.2 and the bugfix branch is already at -rc6
now, so that would be the easiest way to deal with it.

Please let me know if this is ok as a bugfix, otherwise please
resend without the -rc6 dependency.

    Arnd
