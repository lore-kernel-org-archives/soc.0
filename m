Return-Path: <SRS0=HiIx=GZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB10C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:45:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82EBA23AC0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82EBA23AC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MopaEzkkYf0OeRISmTSjEXgtDaHCHKgsOk4GO2/aYqo=; b=y2N+WPdaPgXuR6QqyXXy4rFtL
	YiZZ+DJ9er4boS6LYrYjxbUOsYyAY/j9F5T7rsnxAQemN7goXyWv20MnBgYqJf7JWRMZ2nOPWpp74
	OxHaMSFEa2HGxNWyYJTryTa6sUSgNtnwypmIy60RjKnVy1Ql3SlhfaOUH10YyEtB52YYM8zfotejl
	S+5M+LOCdWsGXx1p5UnjCYwH8Iyk2rwoMrAh8pugzbLHELcjW1hlFKx/9/CH4cyQN5/diZwi68VI7
	yM6jjiJX3B8Vpm8koplIrX6wQ/bWCvtzXfZyE/T6RMMw8YCQ8RGS0a0Ase41tglxlLHkTSLss4xJ+
	fvlqTv2Pg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l359b-0001lM-C3; Fri, 22 Jan 2021 22:43:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l359X-0001kJ-Qt
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 22:43:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1921723AC0;
 Fri, 22 Jan 2021 22:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611355419;
 bh=s91XCBpC8P8/y4FCZn2nGVMSYA7tTMQBH5hBvwq0wW0=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fzHzCzFzYRraXKa0Nm2G8eXIKLPNxSjhEpbJpy04mnfQNRWTYdV9ESyGrloDu3fL8
 TcG7XXkfblmjqmJpWm5I96hQ60+SW25Y3t/8ydg2zBYry4w+b96+cQBkFuRsVmHSLu
 Mwt5s2yR4x6MNSfENFFwXCPcEWzjoSkFvCaDGvWb0vunKpkHcM1hfL+3Y1DvEBzg0t
 iw1aADlyjbr6ePkCouThUND8RzzPjWEEM5NVmVdQ6e1fJkbRfq1gH+6PcJ/WTaB/D2
 XA50821wkMAsah0G1KxvRytF7SiB/RJIFMiW34QZItesiH4VqddfgWOMaSx7Dk9avf
 J+t0wNdb/zNpA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>,
	soc@kernel.org,
	arm@kernel.org
Subject: Re: [GIT PULL] SoCFPGA DTS updates for v5.12
Date: Fri, 22 Jan 2021 23:43:29 +0100
Message-ID: <161135518023.1310202.693022920264235745.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120012334.25730-1-dinguyen@kernel.org>
References: <20210120012334.25730-1-dinguyen@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_174340_007507_112F9712 
X-CRM114-Status: UNSURE (   8.39  )
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
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210122224329.vt-MDPWaWaF3Ay4SRClFGL4zSOQT1PAF1au6MjfEOtE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 19 Jan 2021 19:23:34 -0600, Dinh Nguyen wrote:
> Please pull in this SoCFPGA DTS fix for v5.122.
> 
> Thanks,
> Dinh
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 7c348d8de831a7934ad0ea47ce4c7fe9dd7a7203

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
