Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A74AC433E6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:30:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42E9364DDF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42E9364DDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=plMECcI0z2ByG3lWTiBb+qU8nYoXRS8KNF1Q1+8i4VE=; b=VsBciZMlym14PxVCGCvzVry8D
	azoEfWYAtCYebv0aHg07w0f4HeDZBx3yt593WTflpUDe98LbTPk+ZL7ZdB4V+etm3h+q63EYP8GoG
	j/74A7BarmV7Msn8M/74Gsj9gtkgXXLRtmwp0qMwFhFqCfeOw+zlMQCWCDyeMdaU4582QpxK12ay1
	HU5pfwHZadqMYDdpom0gqZn0uypjJHZHl4LMvUR3hdXvAccDi7ekIxQ3l21tnH7qyRjsOF66XejYb
	F5nIpwp6gcuX7gt9QC1ifEDxXAhYvox23zyQ8/CMdDpZ3FRhz29uJlp8w4wqj6x8MIK5C7YmHugrD
	IkV8PD2TA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oQz-0007gw-3z; Sat, 30 Jan 2021 11:28:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oQm-0007a0-3U
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:28:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1D9864E0A;
 Sat, 30 Jan 2021 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006123;
 bh=wVl5bVcuYp/HPn8t1zDIIFe5Z6C9zjZIpaJ+Ow+lRSs=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NVv6UnX/tszV1BOXlC+wIP0QH8avjaa2gj6YfUIcPkViGHYr9HpGr3BGJogEXbyOb
 SVVL7ML3ilNe7MQVSxzpqkrI/jzVxU4FVGNT5XhcELpySi3TK6+5vcQI0G2Kwp0tgv
 LRFRwK/WX3sitUWwHj0T0Hr6tT3ytg+x3wWKlUhVLedg3hbU5q4JULXWzNIPZntgc/
 qfJ4e42ULPSHpCW/Y7VzVEzQ3vn7e5+NHUSvezmcsMPsBA3gFp0F8jRm8fG3V/rD8i
 +nR3os8BB25B3yxUgIHEpubgdBT+7IssWi/mI1EwkTljLcO7jAVsL1IqwC9CUVp4Rt
 wGMv0Q6ZiQ1Hw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, Olof Johansson <olof@lixom.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, soc@kernel.org
Subject: Re: [GIT PULL 1/3] soc: samsung: drivers for v5.12
Date: Sat, 30 Jan 2021 12:28:34 +0100
Message-ID: <161200610095.2091874.8775611267645584082.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125191240.11278-2-krzk@kernel.org>
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-2-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_062844_238318_86D0F858 
X-CRM114-Status: UNSURE (   9.30  )
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130112834.HNOp29YDUMWyhuUnjhtMFh1qSvqsmpEXEQyXEjOlqLI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 25 Jan 2021 20:12:38 +0100, Krzysztof Kozlowski wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-5.12
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 8bd99a058fb62af53f9603057f2efd635f149575

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
