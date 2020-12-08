Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7487BC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:13:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC1B23B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BC1B23B19
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1M3GYp7DyXWG5rspARA//CF9sWb+aU3cUEpeaX9w7HI=; b=F/q4XQViGSK8rpnJ3CzMdeL/6
	+/FfnohQvmdUk8VO8A99letMizchAeEo2oL25t7l6TGlrdCl4mxQZHhLCJrW/mdpGuSs8ZXjH0k+k
	ZdTt0OzrisWOGH2ALD+H81dlULoB9ZShTQcgfW+u8AhT76SXon0xIzBs8+qXA72C7U/4m4ujV6/oN
	HLl3gBJ9jdofTcCehlwytez5T9hgL/HCQ3RagsXN3+A7isRj8P2TuW8JyO5BJPI7lGJa5CO1VfVWG
	cdCgnF51y63DV1rBiA5HFa2N4ziEG1gcWgGFQ6FDUoMvbYT/aOyj2FCrBHxwZvjAv7EoD13jftCLg
	0/QxkrD5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmm99-0005yy-TF; Tue, 08 Dec 2020 23:11:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmm88-0005cn-PH; Tue, 08 Dec 2020 23:10:49 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	arm@kernel.org
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.11, round 2
Date: Wed,  9 Dec 2020 00:09:46 +0100
Message-ID: <160746884950.2839681.16253662527276648372.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <7ho8j4gkxo.fsf@baylibre.com>
References: <7ho8j4gkxo.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_181048_936487_A2F794FA 
X-CRM114-Status: UNSURE (   8.07  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208230946.3r1TWgSP0FhyVaap6WhmAGNdvpa7KxYZLfvVuODozLM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 08 Dec 2020 11:24:51 -0800, Kevin Hilman wrote:
> Here's a final round of DT updates for Amlogic for v5.11.  Based on top
> of the first round.
> 
> Kevin
> 
> 
> 
> The following changes since commit b6a1c8a1eaa73b1e2ae251399308e9445d74cef7:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 4f9f1415bb1386da26111d2d419e8a73075431c2

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
