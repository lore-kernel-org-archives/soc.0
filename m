Return-Path: <SRS0=7oAA=OR=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB71C433EF
	for <soc@archiver.kernel.org>; Mon, 27 Sep 2021 10:36:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D4C7E61052; Mon, 27 Sep 2021 10:36:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 5ACE86101A;
	Mon, 27 Sep 2021 10:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5ACE86101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4B691FB;
	Mon, 27 Sep 2021 03:36:55 -0700 (PDT)
Received: from bogus (unknown [10.57.25.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C98C3F70D;
	Mon, 27 Sep 2021 03:36:52 -0700 (PDT)
Date: Mon, 27 Sep 2021 11:36:31 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>, Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] arm64/ARM: dts: juno/vexpress: Fixes for v5.15
Message-ID: <20210927103631.oqecn4n3atyxibo6@bogus>
References: <20210922175910.2682172-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922175910.2682172-1-sudeep.holla@arm.com>

On Wed, Sep 22, 2021 at 06:59:10PM +0100, Sudeep Holla wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 

Please ignore this pull request. A boot regression on some vexpress platforms
was found. We have the fix for the same and I will resend the PR along with
the fix soon.

-- 
Regards,
Sudeep
