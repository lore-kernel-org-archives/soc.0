Return-Path: <cmarinas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02598C433B4
	for <soc@archiver.kernel.org>; Fri, 30 Apr 2021 17:58:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AA72361469; Fri, 30 Apr 2021 17:58:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D029161449;
	Fri, 30 Apr 2021 17:58:14 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yang Li <yang.lee@linux.alibaba.com>,
	lorenzo.pieralisi@arm.com
List-Id: <soc.lore.kernel.org>
Cc: Will Deacon <will@kernel.org>,
	soc@kernel.org,
	sudeep.holla@arm.com,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org,
	linux-kernel@vger.kernel.org,
	mark.rutland@arm.com
Subject: Re: [PATCH v2] psci: Remove unneeded semicolon
Date: Fri, 30 Apr 2021 18:58:06 +0100
Message-Id: <161980533328.3085.13894440622093726768.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1619659589-4775-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1619659589-4775-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 29 Apr 2021 09:26:29 +0800, Yang Li wrote:
> Eliminate the following coccicheck warning:
> ./drivers/firmware/psci/psci.c:141:2-3: Unneeded semicolon

Applied to arm64 (for-next/core), thanks!

[1/1] psci: Remove unneeded semicolon
      https://git.kernel.org/arm64/c/9b924f4f0d8f

-- 
Catalin

