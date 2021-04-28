Return-Path: <SRS0=2Xr5=JZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A41C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Apr 2021 09:54:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20BC96113D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Apr 2021 09:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20BC96113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oLgl+9l7y8TXk6y6xGtvcMD7FzyGk+zQcT2YAzWT0v0=; b=MdnlPd0Mk8jxOzbXh6zB9nKDd
	wNaCs9/C10JXjeL6NEH5yli/WJbRx74mPeMlCqOe/dF8964awoQi8JjG+pMLSXA5HSxWYYqZmF87u
	exSOxzVFWnt4GYHCh0yl5IG9LWjL1X5yhjQYllqhd91DPU0iqVVnQAYDptsDBW4TbW49+tO4SZsBB
	aWCmnyst5TsrAv2+uuqSX8Aqnd07nJa81CJTDy/rK4iDR3c4PkJb50m0PJYJFgSLvh2w4P4Ztn9b2
	nv1Aw/OPn3t/RXzji4tBMj6v8gtwVfilZHBluqGLRrkhypwTop0nNcMbzk+g0k1KTjhdohDN6QsLO
	gyaBM3qaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbgrs-003EBD-1F; Wed, 28 Apr 2021 09:52:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbgrp-003EAp-M4
 for linux-arm-kernel@desiato.infradead.org; Wed, 28 Apr 2021 09:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:List-Id:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=QrxyNR7Cx1uJWb3HcSCp0uQruXIfAxe+Q7bNHnE+INI=; b=dPlucl/sVsflc+3jRilyyc9u/i
 1/zFxws+5XhvjOJiBJESW+3mCLmZxXEaoAbD4Eda6i1acT2T7U28lNW9ipQ9uz+cw3ZGZfERmtjka
 VOfT4WUCMv4jeWkUvvEPtDkiRz9tDK0T/SuGRdiRdSzTiSuokwvOhnubJV975KshhJlqxpCm2U4to
 KrzbvDk4AUk5FA8auB1fBEWThHifzG+0uxcTCXhmQU2e7c3ocjuXNHIkAB9Hw+c+H0nDSBNpUrJu+
 G9DpYsW5Lv4O8YMHbuTf9Ml1t2hZiHEgEYxjOaiCsdOaRNVNzY6kIOMVJ7Qg/yRJBqBg/KMGqBXUF
 xVUkdebQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbgrk-00HKbj-Gw
 for linux-arm-kernel@lists.infradead.org; Wed, 28 Apr 2021 09:52:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B6CC613E7;
 Wed, 28 Apr 2021 09:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619603540;
 bh=rReFFjuvDhHiQI/geNWM005Q+WIP2z9uyanWOqbA4ws=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J2/iuiEtWGP/sVGVwuJcE+0jdXll3ZAVicKbpMHkwD+zpcnn8E8FCulSoUhzLPT68
 Al8b8Qhjud/5QSvne+PVSRMDtytZf31B2RKkDyNGrn5mUGvH92rxP1AX+VKNEybG7/
 zOtfTFvLirl/3g3gbpIr/rIZCcqeI8vwLDLgo7zkl97HyQaybzCGvFr8ccRpDB+Vm8
 1Clua6AHLmRj179JnvzPu7oTwFlBzZ3Hklce+VSMAwQHr7gqEbp7JaZhTsQTKSxX8U
 3PiJCGbYVuIQKFz6pmFEuRqbMmQJ/8uwtWDifd/3+xAktxikN2R4HeUEcbxcRxOcO0
 iBitdyZcLl9Lg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, ARM SoC Team <arm@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Kevin Hilman <khilman@kernel.org>
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v5.13
Date: Wed, 28 Apr 2021 11:51:58 +0200
Message-ID: <161960350770.2272527.9069383680761503934.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428093148.flrcowzr2dsj7byz@bogus>
References: <20210428093148.flrcowzr2dsj7byz@bogus>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_025220_617974_2979AAA6 
X-CRM114-Status: UNSURE (   5.62  )
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
Message-ID: <20210428095158.lhEHfKZy-qFhKGPnWJuxiEtZ2kR06l7zIuXNExQs3-0@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 28 Apr 2021 10:31:48 +0100, Sudeep Holla wrote:
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit d4f9dddd21f39395c62ea12d3d91239637d4805f:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: e393cc4e9ce015abc8a68c762dc361cdb0b0db96

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
