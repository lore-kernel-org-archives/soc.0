Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9889BC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 14:57:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DC9D60C4D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 14:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DC9D60C4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5UmqkXxm4q1CJemrPkfuj5JuMXgg0QO4JW369U6yF0=; b=jn3f8a9B8tvT+u
	SNPTUqYKsAQoY7KHT+aXmJhY7h3lfhhbDHp+oXas5OGrtYsWd3Nb0O/Y+SF1eNd+DwNUxN4jTwIoy
	Lhkl8gfaxboghzZx4zFhpugiWOSSOQ+TA8B16pkUYL9wsmKzZ6/yzFaK//xb4MWzIdPB+mexIP7gp
	ST7PEL5A0jV5Q4LHc35SfHWlrs7QzrNUYuJLOZdBOZn5PTra+3GWqGu8cB1BbVA0ReN7QlXWZfDyb
	Bi8d23GwZBN+d9lQDfhmN+SXzPpUwUfm8F2yt1t4E+gcwX0Eo+6kkGZTpxtKuwjXhz2Us6F/3rM87
	iZzrflmaTOfKnXWWKFBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZwi5-009qBY-4A; Mon, 11 Oct 2021 14:55:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZwhU-009q00-BL
 for linux-arm-kernel@lists.infradead.org; Mon, 11 Oct 2021 14:54:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8018060EE5;
 Mon, 11 Oct 2021 14:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633964087;
 bh=pZ+xEJlsAEr0VTBwghNLcMmvrnqahk/7Ny9f+WldpfI=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M8MgE1kCRF8wcwMaeyjJ9VXBi32ZUj0Qw7Q1OgB7RDuZAwiGOUur7Je0oOh8047Px
 5Pgkoq7eTL3g09p9j0609Lr6zVpqdLG1vnTV4No3CVXK0jxehHxYC5QjhN0h29glHf
 7HcEI1byvE92TOHXOLqSLXkLZsn0JdRUm9jidd7jfDwQ8rUaeMjmH3oXzYb0XGgP+T
 9b5noTqTcbPDapVa+7m6BDOD9eTxuwSfVXOeHz5PHkOqXke3V2ecVViF1KRO5Upwbp
 X9o/d89mUJu0GZCt9/vAndApwEhAccOzX7QJZaB1GEMIB09j3teZ6cOMZwcV8kI1Dg
 JL0uGSSOT90YQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-tegra@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/7] soc/tegra: Changes for v5.16-rc1
Date: Mon, 11 Oct 2021 16:54:30 +0200
Message-ID: <163396399109.3170841.4569162737029202550.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211008201132.1678814-4-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
 <20211008201132.1678814-4-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_075448_470035_B6166EC1 
X-CRM114-Status: UNSURE (   6.33  )
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
Message-ID: <20211011145430.UbGKwZRJ9LrPm3SnSzvx30q1aaHyc5l5ZZ7VLx0fVYE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Oct 2021 22:11:28 +0200, Thierry Reding wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-soc
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 94b847c76692b56ab9b9a76c62b831d42b23e18e

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
