Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF43DC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:36:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A6CB64DE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A6CB64DE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=35KkJA0PTWPB6ZRW5k4zFPtJrYBulurUdF/9vqg7KkQ=; b=N2Zw4y1Lbz400GetKlJUkZBwh
	dSMjfMipTXShcchTTeulN7MoY1FicGbJ7fAjl4o8tCmmh7N7CVCMlAM8p1zfhbn2k5l2HUrYKNmJ9
	f8SPVlI/A1z+2eZ0JLfHNoKfIuSFtwNuGmEjeIDayyQVgj6zxNc1EiMPpfM+bVUwYxeBnpiCnRqIA
	yLfTR0VttjRcphUI86J2UhfAeCFIW1O/rdR1XRNfn2tfKiyM5nbqonQlJO2OQpcMtPV+rwcC4lQIv
	yp71DXn3lhp1fWbS7Dy+teB8NSMW+orHUqOVPNwl74BUEINRkhxHgP2zOO2LqZOnVsFzcDYouTYq1
	5qowcBtsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oWS-0001S6-8n; Sat, 30 Jan 2021 11:34:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oWH-0001OE-7m
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:34:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1292264E0E;
 Sat, 30 Jan 2021 11:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006464;
 bh=1n/bsZ0nwrIUoWoKyKy3t+PDsVBV7kD5L24bjqHDG7I=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gLyw3neyn4KQLhn3PoEI1fjBxsKJsxKQolyo4v5MVMqJalKBbwvOR9OY15YwB5Mpk
 AIS0rHpF1MBPiLSTppA0wT0V6E2hDXvZHSnSQzscSnYlEtnVCaz+jl4CKmAiB4oFjr
 jHEESwFTZs8rQkvcIylGMguYgEsXqakTIbLLmYzg/fddJUyVkcV06S3hk4S4wpLQU5
 EKGgg9QDjRtcjVWgUpXcAQLFPzkD0CkzoZjtTCQ/yNnEpeppdMDkP2MlmRI2E4ddKM
 bG40lGOsIrOQx24xEk07I0F9wcjYa8gWsOUfpicD3dZBeCcL8eEetYkhaWjhsAcKj+
 VdMFVFF195VRQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, Olof Johansson <olof@lixom.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, soc@kernel.org
Subject: Re: [GIT PULL 3/3] arm64: dts: samsung: DTS for v5.12
Date: Sat, 30 Jan 2021 12:34:10 +0100
Message-ID: <161200641635.2316427.1280617565306145416.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125191240.11278-4-krzk@kernel.org>
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-4-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_063425_448382_ADD164B4 
X-CRM114-Status: UNSURE (   9.10  )
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
Message-ID: <20210130113410.vO-wb01j3F19LNC6b8D_rgLJ850bPNRUDEYPmxZYI44@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 25 Jan 2021 20:12:40 +0100, Krzysztof Kozlowski wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.12
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 1f99bd1a51b836bc60482370d89bd16a564d28c2

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
