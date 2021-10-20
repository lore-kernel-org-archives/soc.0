Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D27C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 16:09:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1B9A61183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 16:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1B9A61183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8LPVqAJrOm7SUcz4DAv+JA7bUQXBxco9SK5ZchjQCA=; b=SSZFSh6ieP+q3y
	5veCWMW1Bdqgw9eYf3fJEh5rLLfoJ0AO5Dt0w+is4VVp+bc4PUOQemZ0dRI3n1JwKMeOXRXzFUdpx
	Slt7fpaLml+Gjl/6G9JwV6zGNBiGc7fIrDgLpt7Zx3K9uafPxn6z1q7gpU5D0eq36dyeQ7cMDVUkH
	LCiy4JxzRdwLHAkJhhuQVCuTiBOhqD+9W0+konfZT28cbxwTGCEXigXmPbljGZuLqNuQ5BvFOpkOg
	vIB4iCLCttUp29r/o4P/dnWbVKlJzENSzELha6Xj3TqFd39xaiLYnOYMAp48w495UJz2tvVKxuQih
	d91K3cejlGg9qTdA8VAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdE8O-005BdW-Q5; Wed, 20 Oct 2021 16:08:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdE8G-005BcF-1Y
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 16:08:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28B3B611C7;
 Wed, 20 Oct 2021 16:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634746079;
 bh=tNulBRUdC5B9CP1uFp5fS64nI5hkWpCslJ7K6H2oGnk=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mRfhCu4LLWqnhPofUuE7y+muQoQ64wIq++mcG2MP6q4/we3Ry1jH6rpmAZuuSqY7Y
 uWMBEEyJW9lR5kB8F8TDb0IE2Mj292VXMU1iMETlyPrTqN0n4kDTqU5vqoe4Y+MWf9
 L2LWcxmpqaMPQbPpeCD/9zWg8/q0D/fZqkbhusQUf8wN+vX9Xawqbw8gnJIWnMSgZI
 RpzHI3NcLhgN/RbyfJzCrgblFHP/OJQJ62h06ShThueAEvwyn9C1Nmsm9V8zsbPdgf
 5N+K/wSY7Wq1vmcoym1FqT/T3nCyzKcqNWUCkzKQOhfhOsG+VoEA7667VSoNc4Ee39
 +/R9FZg6+42oA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 khilman@kernel.org, olof@lixom.net
Subject: Re: [GIT PULL 2/3] Broadcom devicetree-arm64 changes for 5.16
Date: Wed, 20 Oct 2021 18:07:47 +0200
Message-ID: <163474606232.2486492.10960872772973488386.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211013174016.831348-2-f.fainelli@gmail.com>
References: <20211013174016.831348-1-f.fainelli@gmail.com>
 <20211013174016.831348-2-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_090800_165551_724A4348 
X-CRM114-Status: UNSURE (   6.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211020160747.yqaVCZumVSc5GVj4FvRWWByceycLBhCvS5cOjOKKxak@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 13 Oct 2021 10:40:15 -0700, Florian Fainelli wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.16/devicetree-arm64
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 4f0c2be3d1f998f97e3a473eab23e4885ac6f872

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
