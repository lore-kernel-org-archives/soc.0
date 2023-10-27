Return-Path: <SRS0=pVx5=GJ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E95C25B67
	for <soc@archiver.kernel.org>; Fri, 27 Oct 2023 08:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B554C433C9; Fri, 27 Oct 2023 08:15:25 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06E2AC433C8;
	Fri, 27 Oct 2023 08:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06E2AC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id CEA3C3200959;
	Fri, 27 Oct 2023 04:15:22 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 27 Oct 2023 04:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1698394522; x=1698480922; bh=E7
	LsG9qqvD2/4KHPegnhLWq/DOHqMt+jQWgQ/HtbhtQ=; b=k/sskr2+ofRXh6DHyr
	kdDpNpK8nbtq3eMEk560NNojj44nwcBPNKniKsZBdA1lK+OTsYTazYplmd6/uIjP
	2W34GJn+oUWJ0aqBQWP9zQ53bfRCgQ8AFC2ZKp06R1IJuaIAxd1hOYL3KTmjnD9m
	ddzwTx4fhJIUppAni6mfcxSNNuyGIO7wyHOiTQPyZVhT4iy2q+zCH8YR54TVa/mc
	lPco93PRT7pc7fBErJjkdNawqL594X52u61fRu3SLyIqKoFwMDTGDdlN1BFpSPRq
	kZaVR3b+XJ+qrRG2M5jeecONBl9p5U9a/DcNbQV61dyG5JkncAawjSzZF/3sDFMV
	kXKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698394522; x=1698480922; bh=E7LsG9qqvD2/4
	KHPegnhLWq/DOHqMt+jQWgQ/HtbhtQ=; b=J4xRtNN4EXU0hSfAaG4tXNH+3kbdc
	8H4d3Dh7OBUoOZ4pJAqtb10URkUbOmGMDyPslN89DT3Ux6yBCcMjQSkgAPY05BI8
	vIJRFci0VdV4+apxr1SGJLwyYGbT0KPB+0rZuiKeDah+6dvaUrJQKlMTNHbpjpSL
	9X/GBGs0G04ZB3Cx8aOEW0vUpWcI6wswGxhTU7oGr1V7deMRhF6ur9Rj0rTl6MPd
	fo9lMnKUfkcVhsA2BfHyM3udM8GzW4o1XZxItrOy/EyadEuBzyA0vb8pdhDVfNPh
	QavLljbNnR3Dibmy/YTEH2/Obo4GmgKf5cNaWt/x7TR0fIArNYEuw6lFA==
X-ME-Sender: <xms:mnE7ZdZrPuOa245PbDWXEddIkNxs4zzVdoCALh9eGTk_DZslttpmMw>
    <xme:mnE7ZUZKtBsR5o9E_wnSHzHYdSHLG9Sq3NjS2pbQi3afuLyqZRtFpJM-II8MLvA03
    JzZKPbF-pr3Ccy8VM8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrleeggddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:mnE7Zf_bZup41ucxKyFpwdlXg5irLKTCEZzU8rrrcuAqJ_ggVr62rQ>
    <xmx:mnE7Zboxam1_WEswMS9ltYC5CHYIRx8mfBLn3ns3kdoKvKy7TFZPVQ>
    <xmx:mnE7ZYoMoF5Oy8Bm4sCkDDyNfX2rPLgSNEmaX4GJQxkK-eFTWg4rtQ>
    <xmx:mnE7ZfTZDW-pSlKcbOYF7vWJfWB1s9E_vI6VgOWVVlAOqd4E0EX3bQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id EC0CDB60089; Fri, 27 Oct 2023 04:15:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1048-g9229b632c5-fm-20231019.001-g9229b632
MIME-Version: 1.0
Message-Id: <7250dc29-b532-4ddd-9b5d-def3231acb99@app.fastmail.com>
In-Reply-To: 
 <169826882851.12441.4401916095666705732.git-patchwork-notify@kernel.org>
References: <20231025201109.1016121-1-andersson@kernel.org>
 <169826882851.12441.4401916095666705732.git-patchwork-notify@kernel.org>
Date: Fri, 27 Oct 2023 10:15:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <linux-soc.lore.kernel.org>
To: patchwork-bot+linux-soc <patchwork-bot+linux-soc@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org
Subject: Re: [GIT PULL] More Qualcomm driver updates for v6.7
Content-Type: text/plain

On Wed, Oct 25, 2023, at 23:20, patchwork-bot+linux-soc@kernel.org wrote:
> Hello:
>
> This pull request was applied to soc/soc.git (for-next)
> by Arnd Bergmann <arnd@arndb.de>:
>
> On Wed, 25 Oct 2023 13:11:07 -0700 you wrote:
>> The following changes since commit c0989f7d1264b2b1885345a28a32fd5e1e61f9c7:
>> 
>>   soc: qcom: socinfo: Convert to platform remove callback returning void (2023-10-02 11:30:39 -0700)
>> 
>> are available in the Git repository at:
>> 
>>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.7-2
>> 
>> [...]
>
> Here is the summary with links:
>   - [GIT,PULL] More Qualcomm driver updates for v6.7
>     https://git.kernel.org/soc/soc/c/dfae947836d8
>
> You are awesome, thank you!

For your information, I put the two devicetree branches into
a separate soc/dt-late branch that is based on the existing
soc/dt branch, since they were a little larger than what I
hope to see in the last days before the merge window.

As long as everything else goes well during the merge window,
I expect to send the late branch as a follow-up a few days
in, probably along with an initial set of bugfixes that tend
to come in as soon as the merge window opens.

     Arnd
