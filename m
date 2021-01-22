Return-Path: <SRS0=HiIx=GZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6B5C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:48:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B77823AA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B77823AA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qM7JAYFyf+MelJCO7iPIEOsBFTlP4lhanlKvLpB4vtQ=; b=wXkEb/1Y1PmwxmjVP3ZDroTlC
	J4vQl30PMVDdqgdN7JZXDV25W3Ant64t+wbH8fOB+2ftDMwB0KDLRi42Co5eDyt0f+8IdzdTN1+pg
	S3C92C4u7I53amqXol6rYAiqwvbBZJrTimlC+jfR+0Y7EfyB2SeBgA3ZajRGPB6Ga2zd5bGVhWQEc
	YGF1wt/CPT10O6U1JacEh60/kb1+lio5jsDDfFqN8C86/5LcDqFHDURvjS6/nZE+MSoRJBoIIT+il
	A4rLWH0fNvxZ1J0UQykq+uzuNOjweAbdmSBZLxUhbN+icx/E3ttcCqGzo9gp4tlYQMs+VVzAYmP7J
	0Gpz+lxcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l35Cm-0002g5-IT; Fri, 22 Jan 2021 22:47:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l35Cj-0002f4-FP
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 22:46:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCB2923AAC;
 Fri, 22 Jan 2021 22:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611355616;
 bh=AAUDxcAwbpHTXTCeGZoCgUNBKhwI/UVhl6oKZXYWmSk=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BBxvyZYHAnEfllziBcljQwkO+0P2kXyLj0lgSjG7zWbLT+ZuiawIPoTJpUQmTL+qW
 +IZ5nbP0fM1LWogorGONlxZrpxRT7vRRnFABVFAK+6X2yA4SGbVlK5vCmYt3dfwCR2
 0FlxryTpqBCO6ECG102GSS0i2ntdoJcjxoCUoIhbnkKTI0f+eQCP5+hsigXTTFn3oK
 cBkrHbhPJB2j8IO0VW3Bav9jDArOVziVz7lTg2283jy8jDRZME2tRpG1aexeJekIbU
 NvlgktIQUM+n2txs5bmm2SXUJH30oP3JL9hzmh+aHCldAr3lPRFyv9VRaHyk/EapJF
 9xXy0uw9fj2Hw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>,
 Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.12
Date: Fri, 22 Jan 2021 23:46:52 +0100
Message-ID: <161135560489.1320908.16791887569896437473.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120174356.cnxopzjjpqo5e3ws@bogus>
References: <20210120174356.cnxopzjjpqo5e3ws@bogus>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_174657_629792_9ACD3552 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 Kevin Hilman <khilman@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210122224652.GEfdOEOqlpty7XaVTZPigy9H1XVrrQaPhWv0W55Z20M@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 20 Jan 2021 17:43:56 +0000, Sudeep Holla wrote:
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: e6babd8dded31c0235c2e83871d290dfd407e4fa

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
