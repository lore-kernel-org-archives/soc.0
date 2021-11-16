Return-Path: <SRS0=vwZw=QD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704ABC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Nov 2021 20:16:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F3656138B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Nov 2021 20:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F3656138B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=amAWpM+nOjELuk5doCin3YlgdfoHy/CPl63XKAGmRIQ=; b=0MSjrRgvnRW2yy
	IWpjJl6rNAYZYr9peKmmOUOyYUyEa+UiOTb3DDXH/MOxpbW9izkPiB6WdQXvhQ3fV/0smseCi7k6E
	fgTzlR8ul2H4sGSJKT3q3uZRkB6rKNS+vzKVJUCp/vdt2mRehAUQnVhgdGGlEjSePHsjfHRY+VfuX
	Nql9iAWab84YKJ12QmRM3gHrK45OtKe6eovEmVarDxW1ATS3wdJXBU8lT8ua+zozrZ8Ak6pg+fkVQ
	P04CejGlRPEVABDDoPifIzZ7meIPluK6n/wnXZm99B9ux496uhKfWBGhnJGe2Z18vHgpxiQTxeU4D
	ZY32kInpDF+AK1IkOr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn4ql-002he9-Ks; Tue, 16 Nov 2021 20:14:39 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn4qi-002hdY-5F
 for linux-arm-kernel@lists.infradead.org; Tue, 16 Nov 2021 20:14:37 +0000
Received: by mail-pf1-x431.google.com with SMTP id n26so455015pff.3
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 16 Nov 2021 12:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vkZ73FnE8hvSGaDl0VRT3X3tbLp04AVI9RVdGEbEAPQ=;
 b=bdbeDULduysm+tBz6570AnksWHhm5LTNaVE3Vk+Wx9hx2BfXrwVYE1lB018/iT5Crf
 IwMQlfYo2bbKlSW8cifq7vNHobNodSwhYF6V5IL9ZYCJfj6feZu8WD9QJiXinPrHv01r
 hj65n2UqwASjQptbBQldt6v1Qz13Aa2H9AqD74AX8z5vJejphli2TAnhHMNUWtVF2n7t
 nooIvk2nwYCyixc7mKlWEbBLAErfvPEB0HUIHP7sqCuQbVuRVitwLegG9bfLScVK/tvQ
 MHNQw6keXBC+SsQOhqJ5maGWCyhAjGSKwwfQrQDilUPKTSWF+2P6R6qOSUnIcxEIIWaa
 5vcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vkZ73FnE8hvSGaDl0VRT3X3tbLp04AVI9RVdGEbEAPQ=;
 b=WRTV6mvJovbyDhzCpM/xXBojojxvAs0ID6J2MTmU/PFI/41V2tIY8bibpBKNnGvzWX
 uZgmHiARhAYzYq0JRVlMo5sRV1lMMu83sRcVwt6QUcMFLPSTf1K36/uJwmsbWfqiDdMp
 7b5yF/E8Bp7SFYp7NuDXkpNsuGE6HmANk/Md/odCyUP1o0cqYEO4Kw2CTeUwMFzdD/mf
 Ut7ysRJYQ9aREziMBQdzRuTSj9keKN9ksTWG+AYUp/hTx+qOPvcuAWNiNGfljIqQlUUG
 6QPUe/wVT4Htr3lw3y1N3uu1XaLZuwz+Oy3IFaadW3NiA6yU9jgZ6NnHphfst1DCeUHj
 htQQ==
X-Gm-Message-State: AOAM531VZS9WTIFg4JRXoexTEF5om4uD2uwtWSuhDiU0dSgzqZYbex3z
 8kRKlfSu07IVEVo3XCboeTg=
X-Google-Smtp-Source: ABdhPJxB/DlJWtstmHGN4fJlcjWGjIgShXAtvjrULV/QPwJbGrOyFHHEg8CYig/ALvQPm9q+AKR0TA==
X-Received: by 2002:a05:6a00:a8e:b0:47b:a658:7f4d with SMTP id
 b14-20020a056a000a8e00b0047ba6587f4dmr42647132pfl.82.1637093674983; 
 Tue, 16 Nov 2021 12:14:34 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id on5sm3469955pjb.23.2021.11.16.12.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 12:14:34 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Christian Lamparter <chunkeey@gmail.com>,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net,
 khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree fixes for 5.16
Date: Tue, 16 Nov 2021 12:14:29 -0800
Message-ID: <20211116201429.2692786-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_121436_235474_2B86A455 
X-CRM114-Status: UNSURE (   9.65  )
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
Message-ID: <20211116201429.AU97vMXrQ3DYi86wFT8iQ0mENUSYHuXY2GL_yTenIYo@z>

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.16/devicetree-fixes

for you to fetch changes up to 98481f3d72fb88cb5b973153434061015f094925:

  ARM: dts: bcm2711: Fix PCIe interrupts (2021-11-15 19:09:47 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
5.16, please pull the following:

- Florian fixes the BCM5310x DTS include file to have the appropriate
  I2C controller interrupt line, and allows the BCMA GPIO controller to
  be used as an interrupt controller. Finally, the BCM2711 (Raspberry Pi
  4) PCIe Device Tree node interrupts are fixed to list the correct
  interrupt output as well as the INTB/C/D lines.

----------------------------------------------------------------
Florian Fainelli (3):
      ARM: dts: BCM5301X: Fix I2C controller interrupt
      ARM: dts: BCM5301X: Add interrupt properties to GPIO node
      ARM: dts: bcm2711: Fix PCIe interrupts

 arch/arm/boot/dts/bcm2711.dtsi  | 8 +++++++-
 arch/arm/boot/dts/bcm5301x.dtsi | 4 +++-
 2 files changed, 10 insertions(+), 2 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
