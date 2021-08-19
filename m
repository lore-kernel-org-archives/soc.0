Return-Path: <SRS0=soWq=NK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43A7C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Aug 2021 15:47:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 920FA601FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Aug 2021 15:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 920FA601FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M96m+xXjWrcy+eYRwTRoVaN4GkRwGW18ERJ3TEfXX2I=; b=I7jSTyPXPzG7Qs
	SxhTapsSnW8irIMwgcbuzYLyDV1Ne4PiYZyRtZr9U+dMvvsup808sbuxVRqIYOKZLs4t+hxaL0T5H
	xY24L3C553yQ2VS4diAUOiJJgA9/3OSs6SAWYa5EMLM5Jzxfljmf8nT3bcfwQt1meTjCWuzKD470I
	Xl/gzeKX2rJO5jc6uKMhxlwz3faq+ee01x0wgQNPIikAFvNvQ0lDjTlu9sTpTED3LKfEE1ZTpQaXX
	7II8KHE3uYv5Y1lmrYwCIXcD+Xdqbi+KaazrJxqJ7JQ5q3EwYDzrqF4/7nJqF5BwR8Pe/CPZwGXVh
	P+ErqG0MlmcwZk/3hr6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGkE3-008qo8-RC; Thu, 19 Aug 2021 15:45:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGkE0-008qna-Pc
 for linux-arm-kernel@lists.infradead.org; Thu, 19 Aug 2021 15:45:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4134460EB5;
 Thu, 19 Aug 2021 15:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629387900;
 bh=aVoznOMjkYprKu7dQGoCF0b3hhJ7Mrc5+yaCruzBHKg=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CS4vFW6cBNXgThDUSMNOexvtP3F1T3y6cRpMkfMdwuQ7jHW1rgzh3O5mnmnR+qy/G
 tKxMiCOc950m0jDyLHc6hJEBlsDwUDhvknR5dkgVXZPLuCgrWRltpJBT2qoanHXGK2
 qvG9DsfhlWNyzxYg/sQCRDs8LE8ipkQZAdfjIMO5b4o02ieIoLWvN1UQEyqEFRD89K
 PpSnQTYAjYIUOAQBCE4RUdMVJUj10xNWvtWFa38i2FbN0vEDc5E+wXxiHB6nO+ZV3Z
 QZxfLuw21rqMs7SEH2wN7SMyi5mT8R6W0dwEZ0jhceCGi9/82elLdBk0NsBA9yzxoY
 4HeC7tK3i8pew==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Jason Wang <wangborong@cdjrlc.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH][PULL/direct] ARM: s3c: delete unneed local variable
 "delay"
Date: Thu, 19 Aug 2021 17:44:54 +0200
Message-ID: <162938788185.467628.13192922419725983504.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210818204422.17919-1-krzysztof.kozlowski@canonical.com>
References: <20210818204422.17919-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_084500_883860_5FC59055 
X-CRM114-Status: UNSURE (   5.65  )
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
Message-ID: <20210819154454._iZMOr-YPpR5Q-QtzPm1fdsgWetSnNWBzte83SzZ4_A@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 18 Aug 2021 22:44:22 +0200, Krzysztof Kozlowski wrote:
> "delay" variable on line 79 can be deleted by returning "0" on line 88.

Applied to for-next, thanks!

[1/1] ARM: s3c: delete unneed local variable "delay"
      commit: 319a1b58f6c7432345f13383b26c8c10e7eb1dda

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
