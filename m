Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7E3C4320A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 21:08:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D62A60ED5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 21:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D62A60ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHZJF6S0Y/Lnj2PC77sCls7X+d3Gy4lHt3y5kKUM4K4=; b=WqxThJHAr72MOl
	+cSc1b2MOk+BCNJivEJIrFTQpbxZ3uII2zSUb4RYJQ7zv0iobiI+j/+yfI+NtGEtgespE7w23bWpw
	FpfaFcDujxZ8swjnxnqBb3bRbBw/2qjJUh0PjmWmIvMb8pBnlZZPA73FQH4WMsgTlrpbhVcwcmtbT
	Zvur3zZdVj1Fz74WTc2ch0Bohot98zk27n0xcSGmrIabMM3Ze19m7keORpERSOjYhRTMvH6lbpLqv
	9aCbugvptbO2iIszZdiQjAW8+kUBcOA73Zmy79fPLO5km1IpSCp8s0qjwNsUHRvoFZBrQehePPjxz
	8n0/WB5SP6Vu39RRLQVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHu8-00BJYW-M4; Thu, 12 Aug 2021 21:06:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHtk-00BJTf-6t
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 21:05:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 060F36109F;
 Thu, 12 Aug 2021 21:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628802355;
 bh=2G86AhtLUzdMz/KXHU0KCDVtgkzZLYWuG4BdYDF/eeg=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IWxTYEuDwDz8pIkMXE5OS2vfh1fQPxk81xZUwt/3EZIZcTMJOu48bYSGgc3n9ln/h
 rFk1CmfqEij7+tIvN9VLFtvIXJP7wuSHjvvi/NcLgrb/R6rcP1qo6tsHPlnyCI3jcp
 ga1PKpvD+PW/Yi+P96lT0e3DVrV0vPrUFfX3cGnHrx9llVmbmAaeRfhI5pQVRE1LEm
 lakpNEXNqGmO//9ZY8nN4raUWOuUc4fBoM6JIWV7KrIkP6ieE0QsEyAT+GHk6C+Sjj
 ODwj7HRXsYLl56X9Tn38m7xdib+Y2tS+bYDuSoLm6g1Cjlm2xBHWY22zZroQNiS9qC
 oxLWzWqmiFyDw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 2/2] arm64: dts: samsung: DT64 for v5.15
Date: Thu, 12 Aug 2021 23:05:37 +0200
Message-ID: <162880206183.1376011.8279173071110124884.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210811085128.30103-2-krzysztof.kozlowski@canonical.com>
References: <20210811085128.30103-1-krzysztof.kozlowski@canonical.com>
 <20210811085128.30103-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_140556_365059_3A48D684 
X-CRM114-Status: UNSURE (   7.07  )
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
Message-ID: <20210812210537.7Xdu_7a1q3D8BPWyS46Qmm5Rfv2VOhI-dHnMdt2Z7oM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 11 Aug 2021 10:51:28 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.15
> 
> [...]

Merged into arm/dt, thanks!

merge commit: f73979109bc11a0ed26b6deeb403fb5d05676ffc

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
