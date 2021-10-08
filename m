Return-Path: <SRS0=fGbl=O4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A829C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 03:48:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F08561029
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 03:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F08561029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mvzzrTYrY+Lk67CHyjAYrDtGHHMf8w8LhbBuMJNV6rU=; b=vlcQdVwb4NoYUa
	O9ASJP5ch/aakU3fUusf8qkQ+md41ZVxIkhzY0JUeav27tddBbyDjEXewojdLXUiPFET2s6dtJ168
	ezqinimfejC0J1qANYWXZw58YPJgCqnNBb6UOuyFBw8ld6wwd+S9ljnWu3hw9vZ4OwETpyWgkzS1T
	gUYT2ts85rGSXs9QpcdCk052yQSIcN8bm0XkigA1fwkK8O/Gxt0w4sl/b3HIFW6afXSXhRIVgEMIu
	JOan9QChD1m2h9cIX/wyal8tqYCVZZFREaNruZATp0++OtL5WjLT8aL9eOto5/2Mcq/LFWQtXePtA
	r5Zaqg+x0VjZsLV/XkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYgpd-001SDy-45; Fri, 08 Oct 2021 03:46:01 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYgpZ-001SCu-Gw
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Oct 2021 03:45:58 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so8503256pjw.0
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 07 Oct 2021 20:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hX9WiA94/+jITIvegMFY+BuTehbQ371zzW5Ogx2JYVE=;
 b=PstNJ6j+e+spvgvj/PM3BNyz6iThcz8hLiTZ8+8dPRItcTo8jpoS3i5D8fkk7DWGgU
 lfRHcOVpEYXRNZDQOktbeczSlRPGYRqn44Ifvs4DlCqo0I6BlxXObFR9bI0lc21wNqpZ
 ybDQ55HTvTTGgq4H1uF2OkLU6ziPjL5L5omzki6DZbNncYllPwVtfZiNzrz9O0dWO3Lv
 jRgUdKsM/+A0NdMiLyIB7+D3A5dbV6+8PvEdUYzlknoHks27YFaHfFHs0w8IyDK8G1in
 zX8r2R1X+krF6/NV1W5meykRiqtbggctfgyougL7nFrhaOWXmC7z6CjtpYlLeVU5NjE0
 NW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hX9WiA94/+jITIvegMFY+BuTehbQ371zzW5Ogx2JYVE=;
 b=rhPzE3RjZJ+bxZreHCM4fKt+t2AqrJgACLTd/XO081wDs+7JJ/FrkkQhOra+A/wthb
 BXaP0sUXOcUt+dK9qki+5AAJSEKXaCiV/BRa8RKiqnT0cZawVQ8Iw9VUxMXTTm7l8M/r
 GFvEdFBfy+ZB+sz28gYYgneLaphVl1aPyWwg2GQxmYKjm6eZp8qDkuLcgbgMOWb3HSsU
 WsBfiQx62jMFnQe3lBkz29WqdKWv9Hb1/9jwf6cnPXNOq4mbgcqh0AzHs1FY1PPsus4F
 tjn/k4R7bMAMzBL/g6+9yTo7X4WwPHZ4tBOPLOKiUzBV/eMhEgh/a52NgB1eqfC/4TT8
 8ePw==
X-Gm-Message-State: AOAM5338fPUY6bCwqME5U3jrbJ+KvL3jkJ/HwkUCR81ISwMXUT8QXeiN
 4YDNTzm+B566aH3OCOS/yMQ=
X-Google-Smtp-Source: ABdhPJwB+r1IpmlatcbsfmuqWj+ewWl15JdshFm3gch2kAxCjvlYZWE6/bMa9OLzG887MLO57o1khg==
X-Received: by 2002:a17:902:f703:b029:12c:982:c9ae with SMTP id
 h3-20020a170902f703b029012c0982c9aemr7593316plo.20.1633664756205; 
 Thu, 07 Oct 2021 20:45:56 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.102])
 by smtp.gmail.com with ESMTPSA id s3sm9253776pjr.1.2021.10.07.20.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 20:45:55 -0700 (PDT)
From: Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Baolin Wang <baolin.wang7@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Chunyan Zhang <chunyan.zhang@unisoc.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] Add Unisoc's UMS512 support
Date: Fri,  8 Oct 2021 11:45:31 +0800
Message-ID: <20211008034533.343167-1-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_204557_585598_573F27CC 
X-CRM114-Status: GOOD (  11.47  )
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
Message-ID: <20211008034531.HZSOhgcH6uXp08BfVodiUhDmNdq990o1GyxGz8E4YuU@z>

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

Unisoc's UMS512 has Octa-core ARM Cortex A55 application processor.

Changes since v1:
* Renamed regulator node name and add required 'reg' property for it;
* Removed sprd-uart.yaml which got merged already;
* Added Rob's Acked-by for bindings changes.

Chunyan Zhang (2):
  dt-bindings: arm: Add bindings for Unisoc's UMS512
  arm64: dts: Add support for Unisoc's UMS512

 .../devicetree/bindings/arm/sprd/sprd.yaml    |   5 +
 arch/arm64/boot/dts/sprd/Makefile             |   3 +-
 arch/arm64/boot/dts/sprd/sc2730.dtsi          | 263 +++++
 arch/arm64/boot/dts/sprd/ums512-1h10.dts      |  69 ++
 arch/arm64/boot/dts/sprd/ums512.dtsi          | 919 ++++++++++++++++++
 5 files changed, 1258 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/sprd/sc2730.dtsi
 create mode 100644 arch/arm64/boot/dts/sprd/ums512-1h10.dts
 create mode 100644 arch/arm64/boot/dts/sprd/ums512.dtsi

-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
