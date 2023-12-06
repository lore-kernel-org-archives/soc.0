Return-Path: <SRS0=zKtS=HR=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EECC4167B
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 16:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0A65C433C9; Wed,  6 Dec 2023 16:25:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 84275C433C8;
	Wed,  6 Dec 2023 16:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 84275C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A53C0143D;
	Wed,  6 Dec 2023 08:26:25 -0800 (PST)
Received: from bogus (unknown [10.57.42.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7177A3F762;
	Wed,  6 Dec 2023 08:25:38 -0800 (PST)
Date: Wed, 6 Dec 2023 16:23:37 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [GIT PULL] firmware: arm_ffa: Fixes for v6.7
Message-ID: <20231206162337.emy3kirnsmbgpvye@bogus>
References: <20231116191603.929767-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116191603.929767-1-sudeep.holla@arm.com>

On Thu, Nov 16, 2023 at 07:16:03PM +0000, Sudeep Holla wrote:
> Hi ARM SoC Team,
> 
> Please pull !

Gentle ping! I see you are pulling the fixes now. You may already have
this in todo list, but since it has been close to 3 weeks and during the
LPC week, I thought of replying so that it doesn't get slipped.

-- 
Regards,
Sudeep
