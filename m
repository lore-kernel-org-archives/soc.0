Return-Path: <SRS0=mTu1=AQ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E68C77B61
	for <soc@archiver.kernel.org>; Tue, 25 Apr 2023 21:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6B77C433EF; Tue, 25 Apr 2023 21:08:56 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3235C433D2
	for <soc@kernel.org>; Tue, 25 Apr 2023 21:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3235C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id E0E465C015B;
	Tue, 25 Apr 2023 17:08:53 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 25 Apr 2023 17:08:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1682456933; x=1682543333; bh=UTETzbNeaebnjEnuPs2LB2094tfedUSx+OQ
	HXYRu7zI=; b=MeIAMmpJBjPtZbI7XGjyeQ4jEpHJKMENySze7T+fZQmIJ0/JjlU
	6YOeNMKHxBlgCIXRg7d8lRQaL82/IDdjthhaUxYCJws3mdYevSLpYA7p7sw8o8Y5
	JVWqjjIce2Ub8xa4ChSLjDDKGbYTGUoV/terBUEDVDvralts4io7QVTQjmseSV7V
	7JF4P7cJpIBc/nFY4V6YIdSZiD7A5wpdse7sOHtgqMnr2MjSZ6GWeHHyOSaHcjy3
	vmji/m04FR1BE+fCsp6tAfSnwnwo98ooixnZJDsKQ2xTt7iyuzldYRycqXFzSCUm
	eGiNZj7D/kXCXecyD4GkcQTOpNjkFoQj3dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682456933; x=1682543333; bh=UTETzbNeaebnjEnuPs2LB2094tfedUSx+OQ
	HXYRu7zI=; b=YCphXXQjqDjr253QytdGWILhkFw5E5msjt9ogVaDdFNB1xNM6wf
	eVxL0gHlAi22M2b7rPQTyL4g5EAUQln11ONtuz2p4YGMiE8UOF9bAcc9zLo71xdw
	eG6giL9cYJSqpm68bemf7TIdc/sIr4WBiJSfVcIfgkp2iy+MtG0nUborxJUZaMgu
	oo3GuqghXgIJVYJ9jp8s5lPPGUovcWgrGs4sFlTuvTD4TmhDE1IdJI67Z0RSwzPs
	Xghzv/Kmy2TyviPgGGn730ZVWriHVIcwiSgG/kXOtBo0uzyKDgZsoPqsMIZgpuP9
	yRPC+nroyo0NpelQoAhDqbtPJuwaHBIT81w==
X-ME-Sender: <xms:ZUFIZHPn1dnmEeWg7k4jVd8k1zCwF09o9ffXUP_L6QWJjukZBdVOmw>
    <xme:ZUFIZB_6_k3ieCgwKgy0UtU4BDm2Qdt2TnNpxJpofoCgDAv9Dqkle0m12mY3jIvyB
    Ssd20yfquPx5d8nLA8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduvddgudehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:ZUFIZGSxPLgjM2tuVYCCD-bCKqGwVd7lcx1GLYgrFNzOYL_ezDzg5Q>
    <xmx:ZUFIZLvLSn5UbtyzX5I9DxpLPd1XqFeMCpEjXI7QFccooqK-oJ_JUQ>
    <xmx:ZUFIZPeEii9QE9ye97ONsIJN_9eXW8M2nSpSl16xUR6WTdncCMqt-g>
    <xmx:ZUFIZHFzi27lyq_X_bqwx0RG_XDG2KHOXn0b098Qvdw7Mq-LozDpjQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 90FFCB60086; Tue, 25 Apr 2023 17:08:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-374-g72c94f7a42-fm-20230417.001-g72c94f7a
Mime-Version: 1.0
Message-Id: <305e89e6-dd02-4309-844a-3237723c5707@app.fastmail.com>
In-Reply-To: 
 <CAHk-=wgMmTo=SL1URex5kQbhwGhfBy541tbNbLXrYniAnTxvew@mail.gmail.com>
References: <bbd25997-173e-4c3b-930c-65c6232908e3@app.fastmail.com>
 <3579080b-db88-493c-a260-7313a81e2aa3@app.fastmail.com>
 <CAHk-=wgMmTo=SL1URex5kQbhwGhfBy541tbNbLXrYniAnTxvew@mail.gmail.com>
Date: Tue, 25 Apr 2023 22:08:53 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 4/4] ARM: SoC devicetree changes for 6.4
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023, at 20:21, Linus Torvalds wrote:
> On Mon, Apr 24, 2023 at 2:06=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:
>>
>> ARM: SoC devicetree changes for 6.4
>
> Hmm. This also has commit e49eabe3e13f ("pinctrl: qcom: Support
> OUTPUT_ENABLE; deprecate INPUT_ENABLE") that doesn't seem to be
> obviously about devicetree changes.
>
> Whatever. I took the pull, but that change looked oddly out of place..

Right, this was a commit that is also in the pinctrl tree, and
Bjorn pulled it into the qcom/dt tree to make sure this can be
properly bisected. As the patch description explains, the driver
did not implement the binding correctly, so changing it like this
at least keeps compatibility in one direction (old DTB with new
kernel) while fixing both the driver and the dts files to work
with the documented binding.

Normally this should not be necessary as long as we keep
compatibility both ways, but I trust that Bjorn was confident
this would not cause problems here.

     Arnd
