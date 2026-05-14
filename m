Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A593ABD8E
	for <soc@lists.linux.dev>; Thu, 14 May 2026 06:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741443; cv=none; b=YdZwdgNnrkNtz+k9XL2o9lC6Afv77j50/QLo1hne8KXHT5JGlUQPyxof8ojZGeQLlS6nGLXOUZ627QA6DxukpuLgrWTitrlU1dFtqa8cI+AUsxxS3pUQU21IkHRm9CWGvTaIe9v++lOYysTSijLKdsIIrBztx806Q4qzeCyfdEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741443; c=relaxed/simple;
	bh=3TLOQXX5xKiM2sGIzt1EUEymlZ7tO3evZhBnWPIL1Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ulwty1p0Wym3+KxFkeQrNaO9iTPsh8uNFF11OQz4mSOTcenAZP5uyu0VLiYuUOh/cwLSdpu9WucTHEHc27VWek6kkm88qICIycee0vptqG8/a4slo0jbLibxtKF8hZkoqHehtmjqsuSLKLa74E3dO4IkXpz0Kn28HhkPL9YmJhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHy54+hk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ughu3cUL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHy54+hk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ughu3cUL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E68r3b1965743
	for <soc@lists.linux.dev>; Thu, 14 May 2026 06:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1Bz191QtM3OT7TlZvkr4oqTeTL59KBQ6RMy
	9k++fGU4=; b=ZHy54+hkJxbwZo1XUdhhhFjHXSoJJwPjfIo5MEbYrqvBbk6qjL8
	1iYydyvUnJtPGYzXkVeB/a6BuA1SazqANU+SnAi5sZbXswAqW8/3SWq1Q1wAlnVl
	sWn+gBfaln4WpT1ItVnekAY6/H/Yg9Z5Sux7Ly7evrMfuP5z0jV9vWbPI/LBrvAR
	Gm9sa6/KhMm32jAQ5sV23+cRbIphr29rGgSlwAcFox+UanLk8wcZZKp7O7S3noZF
	VCGXVydV0Hk9A+D6zexF455Ad/WlO35mwZ2BsoQ5PByuAHTpRa2KUeqrs6BGLY98
	TxSc1CDb/7O4y+z9rT6S6p9FL5cUQWUD61A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v884cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Thu, 14 May 2026 06:50:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso9604376a91.1
        for <soc@lists.linux.dev>; Wed, 13 May 2026 23:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778741441; x=1779346241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Bz191QtM3OT7TlZvkr4oqTeTL59KBQ6RMy9k++fGU4=;
        b=Ughu3cULAQ/nGBt7jR+Trnht79AIOZyEyOmZpWO/mDBT0On+eUzYoDphOktAaIvSkI
         kKN73tn99jBlq4ScCF6PvZF50mH8zvZDpTsiqSJByOp87nIRg9nu975qU8vE2Jj1Aloz
         tbIxHrahphHWlUoAJwCWcl0p3alKo+SCWxNmGboYn/V3o8jtrriKnxm7160nc2TcytzO
         S4TzSGhDmz78pA67khBxh/DPEPESAYUTKnIeUdWn5bWDNlXVvecsISeetyDc13TVZGwq
         S9O9wnjvBIz7szLkx5x2bDNXBLAfCy+1VZ6Cq4UypsK/ulj0NcopIn4OOxFAegjc0syr
         azbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741441; x=1779346241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Bz191QtM3OT7TlZvkr4oqTeTL59KBQ6RMy9k++fGU4=;
        b=WrzfRRmYr4SOtjAXq/kaZrGhedmESzeoZYU5S3whCl6iEWNflppYPVsqPf9y3t3onv
         3CgotPGUqa75hCDBPmnqhXK/k/1awls+YIH6UWRDSdK6MPoV6iJoLBsqJrVUDXRM8j/E
         icfbFRbuWNimXuibx8HrFZTd7DSPK/d9sBKu1BGvZv7z7hoD1VYy9OF0TC+JWE9opgO/
         ChB7rBqohP32L2ictn1jdGNqPK6Xxei2C7t3uXT5uAUGzvjocQLmrSptHl10px1Oy1dJ
         O5iDut1v/DYEIfXHbKYgkO5pEZNiOZgqGEWxoVaebZLvYKS4sUULJoUDEzFT35O2i95f
         J1ZA==
X-Gm-Message-State: AOJu0YyPR82JXBgOwcUDzsi2/Z2qnA94zVl9y1Jqbc9lLVJbL94vxBtW
	IMb6DGT2yHcnqIkpLrDx+k7akcV9DusIgBlFkU3vSvKD3gz8qAJ8xtNECRymSxfrqw+5aSqt0CU
	axLnD7w9OZrEwjRUm+9Hpwmq1BPcpc17rG86kTHD0gmyNxOa8oO0tNpFYctPnJDE=
X-Gm-Gg: Acq92OH3rh56wwoIdhgLebX9dq5Jfk7/Xh9omJEOrm+YrHt1jDcabFdn8kLSg9kLh+Z
	FjiB47HRHH7UVgrM88hbUaakRDNAyhni0UtpgOeKnGB7waap5ZLkRPcKPR7r8OK8XRbeT9ycQKh
	6M25gkRe+g5Ff0IlMjJUFPY10Uyz1T7NmpOf7hxaz1j+gtVtoLJ754/gFD78OLH4ewNJxEmyO4I
	BEykJ2wjJLxAnDtrxGXCgOLfcpWLKpfVK0HOxDAyYWt2qcr/89eevuniOEI9dj9wd7NwtL9JJhL
	SN2ClltANgLRqKI/OKtKd4vXNedQ5oZQCOZEwCgEhcGbm2Pb4QjwSmjIKFkrpFOc42yksf2ojzY
	dOHrqeR3GKAgqx1yUAbl7WsjyDuZhWezWvDQh
X-Received: by 2002:a17:90b:554d:b0:368:a297:bd3a with SMTP id 98e67ed59e1d1-368f780eb3bmr6656801a91.8.1778741440879;
        Wed, 13 May 2026 23:50:40 -0700 (PDT)
X-Received: by 2002:a17:90b:554d:b0:368:a297:bd3a with SMTP id 98e67ed59e1d1-368f780eb3bmr6656732a91.8.1778741439587;
        Wed, 13 May 2026 23:50:39 -0700 (PDT)
Received: from work ([120.56.195.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ede20a50sm5400043a91.3.2026.05.13.23.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 23:50:39 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: soc@lists.linux.dev
Cc: bjorn.andersson@oss.qualcomm.com, konradybcio@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, wenst@chromium.org, arnd@arndb.de,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3] arm64: defconfig: Enable PCI M.2 power sequencing driver
Date: Thu, 14 May 2026 12:20:17 +0530
Message-ID: <20260514065017.11305-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA2NSBTYWx0ZWRfXw75seq2up6mt
 Sk5n4npdVzEOmUyoBLDPfJeWCtB5u9tU7Wg010GLC90p6re0/8SWWhyrUZ55p4HtIAbxgfV5wmO
 1WZotJPIJBs5/SNvw8swiWm5CBY4OFvjwayEeSmKTJAqu4XqoJ/x4i3ccFrcETHGcTTdy3ZBilf
 ZDvsjmF4ROzHa2sBCGB6zCCF8Soa4kE804bfTXinj0hlnbP9+wjRcwEV2YA19Pu3tZcKfgYjyru
 +/Tu3X+UfsRrSO+pJUYfGmvsEDrejG75i5C0oC5kjf9lW9eb9F3/huufF3UQQd3Sqz/B3TM3wUf
 pQD1aoF47L4gUYn+AZlsFv3NaBXsgEabjtvnwAazN5PoBuYn7GJRyYuWL8BEEk1DKlFrCd+CuPA
 sLa+Os/obyQRYeoWEaCvPV8iyZAaUJwlGQMIdP2qdKi8iphw7Ku2KVrkNCv7l1IqUmlDOWJOzmo
 xfEYrDYiwoNmafEjzqA==
X-Proofpoint-GUID: A4jZLzZlgNCuzVJMj3jk0ORXW_YyhL0z
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a0570c1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=QkUiPtlOeBxfVnO1KVo74A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Mt3aZHS-KmEbwue0ZEsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: A4jZLzZlgNCuzVJMj3jk0ORXW_YyhL0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140065

POWER_SEQUENCING_PCIE_M2 driver handles power supply to the PCIe M.2
connectors and is required on wide variety of ARM64 platforms such as
Qcom Snapdragon X Elite laptops and Mediatek Dojo Chromebooks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---

Changes in v3:

* Picked the reviewed-by tag
* Sending it to SoC list as Krzysztof suggested

Changes in v2:

 * Dropped PCI_PWRCTRL_GENERIC change since it was already applied
 * Reworded commit message to include ARM64 platforms making use of this driver
 * Added R-b tag

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..96ce783f24e7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -260,6 +260,7 @@ CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
 CONFIG_PCI_PWRCTRL_GENERIC=m
+CONFIG_POWER_SEQUENCING_PCIE_M2=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y
-- 
2.51.0

