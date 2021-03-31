Return-Path: <SRS0=CMgu=I5=milecki.pl=rafal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7377C433ED
	for <soc@archiver.kernel.org>; Wed, 31 Mar 2021 22:52:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7838F61056; Wed, 31 Mar 2021 22:52:29 +0000 (UTC)
X-Greylist: delayed 2398 seconds by postgrey-1.34 at mail.kernel.org; Wed, 31 Mar 2021 22:52:28 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EC0D61007
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=rafal@milecki.pl
Received: from 2.mo4.mail-out.ovh.net (2.mo4.mail-out.ovh.net [46.105.72.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EC0D61007
	for <soc@kernel.org>; Wed, 31 Mar 2021 22:52:28 +0000 (UTC)
Received: from player750.ha.ovh.net (unknown [10.110.103.2])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id B483B27074F
	for <soc@kernel.org>; Wed, 31 Mar 2021 23:36:38 +0200 (CEST)
Received: from RCM-web7.webmail.mail.ovh.net (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
	(Authenticated sender: rafal@milecki.pl)
	by player750.ha.ovh.net (Postfix) with ESMTPSA id E05C21C91F28D;
	Wed, 31 Mar 2021 21:36:30 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 31 Mar 2021 23:36:30 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
 olof@lixom.net, khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [GIT PULL 1/3] Broadcom devicetree changes for 5.13
In-Reply-To: <20210330184006.1451315-1-f.fainelli@gmail.com>
References: <20210330184006.1451315-1-f.fainelli@gmail.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <498a63cbc96cd52210260e6d0229ad74@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16962245047560146671
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeivddgudeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvffujghffgfkgihitgfgsehtjehjtddtredvnecuhfhrohhmpeftrghfrghlpgfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeeutdfhveehfeduudfftdeigfejuddtvedvledvjefhjeejhfekueelvedvkeelgeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejhedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhg
Message-ID: <20210331213630.teHq9gSaKk95y59FfzplXRng8IkQP8-Tpn4ee9FADoA@z>

On 2021-03-30 20:40, Florian Fainelli wrote:
> The following changes since commit 
> fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
> 
>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git 
> tags/arm-soc/for-5.13/devicetree
> 
> for you to fetch changes up to 
> dcb56d61d5a8acca0a357cc603397bc0272ce4cb:
> 
>   ARM: dts: BCM5301X: Set Linksys EA9500 power LED (2021-03-29 11:43:45 
> -0700)

This one seems a bit confusing.

Command:
git log arm-soc/for-5.13/devicetree
shows me only 2 of mentioned commits

Web UI:
https://github.com/Broadcom/stblinux/releases/tag/arm-soc%2Ffor-5.13%2Fdevicetree
references dcb56d6 but opening it shows page with a warning:
"This commit does not belong to any branch on this repository, and may 
belong to a fork outside of the repository."

My guess if you didn't push your local devicetree/next branch.
