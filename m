Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501EDC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:37:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FCAD64E04
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FCAD64E04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YMMDThwaumq89VWtf7OOnT1t+PETqBGS85xkIDX6mFk=; b=yAq3yYwkyuz54+f2YEhTGLq+P
	enTjvhVapR4OdD7vnKDnMMWSyRNu416/trV2VKK6++Tkm63NGMI8xRn1HRCEabUXS0fMHsVjqoFq+
	mcXmHxje1KI6kKrJG9LWrPTMjvTvq/nuUAPTmoOXigxbEm8zdCIMKdo3glj9xF3juXSJplHmHBIds
	8teUFjp8Kdd5VqssJy4K3zVsoBxn4Ihu7I/Las1m/EUV1p0x7DpCgyhmRz8kmGWEi3jWktTxl/eHo
	b8NeJoDtAvnNpVxhB4GULoRTF3kIZbi/M+GkHlhMFkjJ1NrCgjs09VxJt6yqOtW7t1NNs6KGICb2J
	0yjdMx1nQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oYB-00028u-K7; Sat, 30 Jan 2021 11:36:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oXu-000219-9M
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:36:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B28864DE7;
 Sat, 30 Jan 2021 11:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006565;
 bh=URTXjAQJvu8ExasvtoXs6ZJpkzS6u3m9DAlTYSchQ5Q=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KD4I88UW8SnEFZPwLhCC37C3E+fuxGns9d9OZ7/YY3Xl3uKgYZpqXyc0Tog29K8HX
 KNlTZJF+bHjqWXgl6bDjPS7NHtk/zlM7Tv2jIXkZSXJL1KSSBg49qkltOSH5beTuzD
 WohQId+grpHA/W/728lfLZ+1i7VWtvkKn0SVrgXG0Cno1cvmnIQfzA3v9BzB6hw4XO
 pYHDV8Ez2wrsVBEypmOia6QtZgRnrlEd6K5N86FVWeG+ND1mQV8SowQj/9PxBUL2qv
 oo1WI/Dfmmd52U7lnnQ3Mq0m2QpwwgxVt/PCIfJq8WH+Vb16DJv+OuG2Mi7P7XaaBY
 7zoV0vIKcjJqA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, soc@kernel.org, arm@kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: add STM32 CEC support
Date: Sat, 30 Jan 2021 12:36:00 +0100
Message-ID: <161200655725.2395965.6585888046023384484.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129084842.29123-1-alexandre.torgue@foss.st.com>
References: <20210129084842.29123-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_063606_446047_C00304BF 
X-CRM114-Status: UNSURE (   6.93  )
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130113600.LERo3YepBgHVqwX5NkA9Gd9BOywFnkusjyJQF6pTKWo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 09:48:42 +0100, Alexandre Torgue wrote:
> Enable CEC support for STMicroelectronics as loadable module.

Applied to arm/defconfig, thanks!

[1/1] ARM: multi_v7_defconfig: add STM32 CEC support
      commit: f1f9580527705906e2af90f06c0c2025479fc412

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
