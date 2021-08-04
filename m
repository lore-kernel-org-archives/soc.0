Return-Path: <SRS0=0Qs2=M3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA868C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 14:13:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 871D960E09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 14:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 871D960E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C98RdkuiRoTqHpX0IZMqbNtdgDDouKS/nk1HyHUfMGQ=; b=Ep09SySONih+qu
	EFw6DWFTjNKgfNnnpWNxpFnA0gweNiwcuyYiDavcj1NL7WUvR0dTliH7ypUeC1zJ3p+1qT3Ni0il4
	Co8N+pFWFW6KtGqD4gOwjR1zlhbUIW6Rhw1s3snBDSR+0wP4xW1ZYsVAVhtdqO1hjKF3dgvUPRxB8
	HsoZ7sGiiBkztYDEcjogfr4acdGByNFx4PK9N8BDpmi8gkbuTUTrAVnj2w1q3X4JuS6//rYZ2KGdi
	wY8akAMfiHPchenhMlUPbEifW67P9maMUofxBjoP1XC0vqm4UrhERy8a78oOBkOHrSZKYbza8Z10O
	0CBPqoFk1jR8WErzjw0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBHch-006M99-Im; Wed, 04 Aug 2021 14:11:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBHY9-006JTU-UA
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Aug 2021 14:07:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9A3160F22;
 Wed,  4 Aug 2021 14:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628086033;
 bh=nUKjfTjVVS41wLMPjd2wAc1xrHe9Ri5cKv/cFw+Myvc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c2Z8IvBIJjBeYfkeBtVHjvwxaDLDBFu0b2ZCg4aq0Z5ZJBCpx5QZG7QFt4dGSUcdY
 0ima0ahoIpvKWep+qQDMtf9bf0yakQwudYVO4CnpDtsKVgsmonZdV/vY0nmABIfHqR
 Gz4Edbkb840xlzFrvWA7yCeYyLhOM3eISiv7923HG1IMIW0ejw/VMqeg10JuAAGeSH
 kKXUIuq71ieYqhhPNMiaDk4RI4ipJWD7PHoQMmezmL+TPoJJ9YVFF11KNlBZebJQas
 9tIkZeNaCfLT2Ga0yZgUuBvFx1Ww5ie7/TqlE3mWPdjw5AJU2+i2kt1dbq/Zwrth57
 PvY3ipHniNlrg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [GIT PULL] IXP4xx driver updates for v5.15
Date: Wed,  4 Aug 2021 16:07:08 +0200
Message-ID: <162808601953.733405.10635566719744310466.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACRpkdZaCosXsgp02nuUbd_nEvdxm5-z0+d0oSA97UTWQ0RQQg@mail.gmail.com>
References: <CACRpkdZaCosXsgp02nuUbd_nEvdxm5-z0+d0oSA97UTWQ0RQQg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_070714_103836_A041A4F9 
X-CRM114-Status: UNSURE (   9.99  )
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
Message-ID: <20210804140708.UDAHW8Y6K8h3Z8bqEOCxZYagSfCUxISc1xyoN8iyAik@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 4 Aug 2021 14:44:18 +0200, Linus Walleij wrote:
> this is a set of combined driver updates for IXP4xx targeted for the
> v5.15 merge window.
> 
> I am sending it to the SoC tree because of the cross-subsystem
> dependencies and since the corresponding DTS changes goes
> into SoC. These will be sent separately.
> 
> Note the following:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 775dea4deec679c24b525b258c341a45ff1de9ea

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
