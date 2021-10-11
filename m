Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42932C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 10:02:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03D1460F22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 10:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03D1460F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OrzS7qmdBIQHXdwvkyOPVFcD/oZ001Qi0+9wAaV/onA=; b=TcChoLYL60cxMX2xfcznlS0/W1
	I7JnobUrO+xfQ15y701Sv4BNVl2JLaaSOv8aJ1dd1jgfKu8bmlew9RLqzCvrwLDwjL/2yaVuQxRD5
	oQ4d87SGNSoCntZXouqXEyzl9gIuyLu0sptKnQ4qwrmSX14/Q/Dd6fsmLIDENMv0c65LbYFrK/y1w
	YNsYarpUHhOoDN9QoqvpSZn62W0kCO/9rq6qb4q+o5i8C1UBlk7GlSFLximTirESuxZ5IO9lpM/3e
	ipnlIIz+lkuZUVhne4r8jM2KWWX3I72+yZhDXX6a8wt91aZcGNiRhSvDoMYg23cWpc/ww7R6QXxfg
	NO3DP2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZs5j-008iD9-DS; Mon, 11 Oct 2021 09:59:32 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZs1p-008gQE-9i; Mon, 11 Oct 2021 09:55:31 +0000
Received: by mail-wr1-x42c.google.com with SMTP id e12so54260401wra.4;
 Mon, 11 Oct 2021 02:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=KEIQBY3yB7sFijNbITIbAy1U/OJ4y1qB7wieoUaKB/E=;
 b=XEPysK+Rjyy3n9BjU3ugmKz+veslyzHP9+UrUAGH+ZDJjYeQFIkZlkRnOblTHEIW6j
 08Ts0AF8/i4yZzWcCAKsy3Ec/jIIVCFEWcdaVkSGBcGXicCM8659+EF63b9efEZRcAju
 nYcku52ca9sHPKAPUnzXKNUwsD4QjSkDF8QvdXjTzHb4UjIJoOWg0Ik9OidYY5+9/70j
 qhd0OGdyWgAVv1KezePL25IoO/ySv9yO4JNcFm9KMQBEIb0nNLvRszH9obdUNx86wq3v
 gEYyGju93zDn6WKWvPd+oGUU7lj2GSWab3zf/sCTozflzHOGjnk+rr9N7SOKMeghRwOS
 gu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=KEIQBY3yB7sFijNbITIbAy1U/OJ4y1qB7wieoUaKB/E=;
 b=BFgXyTsZ8lraM9Zi2I1+B/vsR+LZrzWQ0kbAU9XSF01nCXK/1VTmpgI+UZmezp2wWN
 TDocEFLXHC5qKCkzqsU6q9nDjN9LdnlZoQjxx7HjzIeTcSeQtQS6pK5Rg+3ZkSVyvRaI
 Ybe8S4XHvvwQkLB/jzvtNA92XVE4jNiqFcm/UkNCxx8rfwIKDELdbq1NmfUGsCLRmgK0
 xs/rfLyRAIBJ3Pjs+4w3fDytmk7JR50JLYdNKoPhQnzSgKSsJ1KFJ0nVhS9eL1vgWrYy
 MNbT1PW4vj2601+VWgl/+JKTZKgscQnWbkiwYuAYnV3//xaYwNCFJTKWPhlPNVSCRC+U
 aA7w==
X-Gm-Message-State: AOAM5326IvonhoqdHNMqloFj4PUso/TqhU/GW2mPJv4+o6OM84U8veAk
 OIr4iXmQ3Aicr/NA1AQF0TQ=
X-Google-Smtp-Source: ABdhPJw0+3/W6Wqq6fe4+vkQBNKdlbk9kHb4dQMk/hWb0t6O0C2Jpfu7OsnTGuF2HQ2KpdmK/uba8g==
X-Received: by 2002:a05:6000:1b83:: with SMTP id
 r3mr22761183wru.240.1633946127067; 
 Mon, 11 Oct 2021 02:55:27 -0700 (PDT)
Received: from ?IPV6:2620:113:80c0:8000:c::779? (nat0.nue.suse.com.
 [2001:67c:2178:4000::1111])
 by smtp.gmail.com with ESMTPSA id q12sm10333479wmj.6.2021.10.11.02.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 02:55:26 -0700 (PDT)
Message-ID: <7135d46f-5fb9-b46d-96d4-3b38548fe23e@gmail.com>
Date: Mon, 11 Oct 2021 11:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Frank Wunderlich <frank-w@public-files.de>, Luca Weiss <luca@z3ntu.xyz>,
 Sungbo Eo <mans0n@gorani.run>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: dts32: mediatek updates for v5.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_025529_442932_01469183 
X-CRM114-Status: UNSURE (   8.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211011095525.Bx8Hp5XlITD6qgG9Kb-nPBsXE8aHwkBJY1T8gxBmwrk@z>

Hi Arnd and Olof,

Please have look to the latest arm32 bit DTS changes.

Regards,
Matthias

---

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.15-next-dts32

for you to fetch changes up to 1b17eee4d48df3c7aa90a6ec2c9b53adaaa6776f:

   dt-bindings: arm: Add MT6589 Fairphone 1 (2021-10-08 16:33:16 +0200)

----------------------------------------------------------------
mt7623: add USB nodes
mt7629: update PCIe node to new format

----------------------------------------------------------------
Chuanjia Liu (1):
       ARM: dts: mediatek: Update MT7629 PCIe node for new format

Frank Wunderlich (1):
       arm: dts: mt7623: add otg nodes for bpi-r2

Luca Weiss (1):
       dt-bindings: arm: Add MT6589 Fairphone 1

Sungbo Eo (1):
       arm: dts: mt7623: add musb device nodes

  .../devicetree/bindings/arm/mediatek.yaml          |  1 +
  arch/arm/boot/dts/mt7623.dtsi                      | 33 ++++++++++++++++
  arch/arm/boot/dts/mt7623a.dtsi                     |  4 ++
  arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts      | 25 ++++++++++++
  arch/arm/boot/dts/mt7629-rfb.dts                   |  3 +-
  arch/arm/boot/dts/mt7629.dtsi                      | 45 ++++++++++------------
  6 files changed, 86 insertions(+), 25 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
