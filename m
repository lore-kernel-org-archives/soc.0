Return-Path: <SRS0=X/nU=I5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C398C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 21:38:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 289AF601FB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 21:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 289AF601FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jYp7JjeCspVU3nRwen6qdR16sxuj60CFreY2UnHPC0s=; b=CC8sbKrgXHh7i5+3RMBJwK6CG
	q11EGk69ikkjbR4iZPVZXSU3/nZP4zQeMoKS/++WIevJiZQXLLTj+TsTUw4X1bAQuh1VgN2QyP85T
	zL/EEjpcD2YKUT53kE1uZaA5NsSsPumrw9mUpswLZKdWbG35ypYpbJcOhU+3xBLsPrjoHYSjkcjxj
	YrzEiNBFKguSfPAcwpYJLnrhk2k6EQlCkZrXe4Lzo8FX94I8G42h8zNC0vV/WnMzZmNyTMb3LdxoL
	cccy8SpiXZl244/QW5JzQG7HahtJubh6E7tLnwQEBs1OIRf2hJhWnBjYFL19G+BDL2+unBDoiZkGh
	Y0gb9p67Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRiWA-007iD3-SK; Wed, 31 Mar 2021 21:36:51 +0000
Received: from 2.mo4.mail-out.ovh.net ([46.105.72.36])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRiW2-007i9n-6S
 for linux-arm-kernel@lists.infradead.org; Wed, 31 Mar 2021 21:36:45 +0000
Received: from player750.ha.ovh.net (unknown [10.108.20.237])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id BF697271439
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 31 Mar 2021 23:36:38 +0200 (CEST)
Received: from RCM-web7.webmail.mail.ovh.net
 (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
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
X-Ovh-Tracer-Id: 16962245047560146671
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeivddgudeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvffujghffgfkgihitgfgsehtjehjtddtredvnecuhfhrohhmpeftrghfrghlpgfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeeutdfhveehfeduudfftdeigfejuddtvedvledvjefhjeejhfekueelvedvkeelgeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejhedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_223642_493976_238834B9 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
