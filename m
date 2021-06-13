Return-Path: <SRS0=VOD1=LH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BE9C48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 06:03:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E285D611CA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 06:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E285D611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EGJ42zC2hu9y1cNnICc6/W1P70F/VZ8vyZtpHA1UNB8=; b=mM0QMrOzFCX8VN
	a/gPWTVtZxqkOJFFLdODKVxFYL6hK396tQXnT07ZEtx7J+luy3K0KiMAIb8U2R7uFvguZq/FYgGx+
	C8FdbMUsL5mRONInH7tTC8Mijzfq4i9+w6DLzkKYROohcObZOJ5N84YbNnRmMRY1bNntoRYIPlkav
	5ZuFCf/vpiyn2xGZdyqPPhb+W5QKmqduaIqgK6vjgtfErSv1wuaheDyuJhntQmfw4H8MZCij5+uFp
	aOjP5nrTEkbtRurN7boPqkZBeCKG4wBJzJIBP4/CSFR/CdPOrkmOuC0Vxhh3+PNSRHH9+41U567/V
	r38g2ql82SYQaXlfmM2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsJBb-009lzC-JO; Sun, 13 Jun 2021 06:01:31 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsJBF-009lyj-DW
 for linux-arm-kernel@lists.infradead.org; Sun, 13 Jun 2021 06:01:10 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15D5tdDB145614;
 Sun, 13 Jun 2021 06:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=lrDHu/B7kRhqXFBy0o1juB+Fx+ejQRdmlkOp47EaafU=;
 b=lwTtw9Q5e0OOKQxMhoYnqr1+XHjMJ7uAhn0ZGnlWw+OdQsq+FIvXS9wh2KOCmEG4KkVH
 1zVNqHaMA8aLbUPQcDpFtOIzGa8vjEpjB1RzlVAhIPltSOVL91vyz/ybLxSGeGJddJWi
 sCmuzSQ4wGitqqS78Eb7m8ILPMBwjtJAXhSe5kkAUP4VbsLR0MqDC8utgh8lRD5S/IPN
 HaMxb7HRJNZTzQrAFeIKMz44vdiIlGp3Kle6UTDU+CQr8OOgFNGCsra4jWnrgwPQnOH5
 9f19MlWj+o25gLuLOEaGzmyXrTUqx/E9TcIqaRH0/FBSwgY4t7Yzp2k5zNkBpI++ehOw aQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 394mvn9dt3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Jun 2021 06:00:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15D5snRB177468;
 Sun, 13 Jun 2021 06:00:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 394mr3y2r3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Jun 2021 06:00:57 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15D60u06007204;
 Sun, 13 Jun 2021 06:00:56 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 394mr3y2pq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Jun 2021 06:00:56 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15D60jqG009234;
 Sun, 13 Jun 2021 06:00:45 GMT
Received: from localhost.localdomain (/10.159.245.252)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 13 Jun 2021 06:00:44 +0000
From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
To: arm@kernel.org, arnd@arndb.de, olof@lixom.net
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 santosh.shilimkar@oracle.com, soc@kernel.org
Subject: [GIT PULL 1/2] ARM: DTS: Keystone K2G cleanup for v5.13
Date: Sat, 12 Jun 2021 23:00:20 -0700
Message-ID: <1623564020-9958-1-git-send-email-santosh.shilimkar@oracle.com>
X-Mailer: git-send-email 1.9.1
X-Proofpoint-ORIG-GUID: qnOH2JPI7zgfoKjMI5Lv8xD6DffMrukR
X-Proofpoint-GUID: qnOH2JPI7zgfoKjMI5Lv8xD6DffMrukR
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10013
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=904 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106130045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_230109_568149_D3268733 
X-CRM114-Status: GOOD (  12.15  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210613060020.PTNU_El163PECdfXducWb0qTaL8dwEo8MO_AhAtUG0c@z>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/keystone_dts_for_5.13

for you to fetch changes up to 0b5194dec85b9f3971900129f9a3584a6cb5918d:

  ARM: dts: keystone: k2g-evm: Move audio oscillator assigned clock to mcasp (2021-06-04 13:32:47 -0700)

----------------------------------------------------------------
ARM: DTS: Keystone K2G cleanup for v5.13

  - Rename message manager node
  - Rename the TI-SCI node and clock
  - assign clock to McAsp

----------------------------------------------------------------
Nishanth Menon (4):
      ARM: dts: keystone: k2g: Rename message-manager node
      ARM: dts: keystone: k2g: Rename the TI-SCI node
      ARM: dts: keystone: k2g: Rename the TI-SCI clocks node name
      ARM: dts: keystone: k2g-evm: Move audio oscillator assigned clock to mcasp

 arch/arm/boot/dts/keystone-k2g-evm.dts | 11 +++--------
 arch/arm/boot/dts/keystone-k2g.dtsi    |  6 +++---
 2 files changed, 6 insertions(+), 11 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
